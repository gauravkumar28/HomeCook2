class OrdersController < ApplicationController
  before_filter :login_required
  def create
  	@order = Order.new(params[:order])
  	if @order.save
  		flash[:success] = "Order Placed Successfully"
  	  redirect_to chefs_path
  	else
  		flash[:error] = "Order Not Placed Try Again"
  		redirect_to :back
  	end 
  end

  def cancle
  end

  def new
    @location_id = params[:location_id]
    # twilio_sid = "ACb144919d3af4655207b682f28d3882a9"
    # twilio_token = "5994e565f9bf70f5f247f6177bdbfa93"
    # twilio_phone_number = "2016764649"

    # @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    # @twilio_client.account.sms.messages.create(
    # 	from: '+14196054656',
    #   :to => "+919986895741",
    #   :body => "This is an message. It gets sent to Tinkesh")


   
   # ActionMailer delivery
# sms_fu = SMSFu::Client.configure(:delivery => :action_mailer)

# sms_fu.deliver("+919162485029","at&t","hello world")
    @order = Order.new
  end

  def update

  end

  def apply_coupan
    @coupan = Coupan.find_by_code(params[:coupon_code])
    @discount = @coupan.discount if @coupan.discount_type == 'absolute'
    @discount = (@cart.total - (@cart.total * 100 *  @coupan.discount)).to_i if @coupan.discount_type == 'percent'
  end

  def login_required
  	unless current_user
      session[:return_to] = request.fullpath
      render :js => "window.location = #{new_user_session_path.to_json}"
      #redirect_to new_user_session_path()
    end
  end
end
