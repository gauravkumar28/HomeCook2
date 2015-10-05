class OrdersController < ApplicationController
  before_filter :login_required
  def create
    if params[:shipping_address].present?
      address = current_user.shipping_address
      @order = Order.new(address1: address.addrss1, address2: address.address2, landmark: address.landmark, phone: address.phone, location_id: session[:location_id], user_id: current_user.id)
      if @order.save 
  	    flash[:success] = "Order Placed Successfully"
        @cart.clear
        redirect_to chefs_path
      else
        flash[:error] = "Order Not Placed Try Again"
        redirect_to :back
      end
    else
      @order = Order.new(params[:order])
      @order.location_id = session[:location_id]
      if current_user
          @order.user_id = current_user.id
        if @order.save
          if current_user.shipping_address.present? 
            current_user.shipping_address.update_attributes(addrss1: params[:order][:address1], address2: params[:order][:address2], landmark: params[:order][:landmark], phone: params[:order][:phone])
          else
            shipping_address = ShippingAddress.new(addrss1: params[:order][:address1], address2: params[:order][:address2], landmark: params[:order][:landmark], phone: params[:order][:phone])
            shipping_address.user_id = current_user.id
            shipping_address.save!
          end
          @cart.clear
          redirect_to chefs_path
    	  else
    		  flash[:error] = "Order Not Placed Try Again"
    		  redirect_to :back
        end
      else
        if @order.save 
        flash[:success] = "Order Placed Successfully"
        @cart.clear
        redirect_to chefs_path
      else
        flash[:error] = "Order Not Placed Try Again"
        redirect_to :back
      end
      end
  	end 
  end

  def cancle
  end

  def new
    if @cart.total == 0
      flash[:notice] = "please select items"
      redirect_to :back and return
    end
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

  def send_message
     # twilio_sid = "ACb144919d3af4655207b682f28d3882a9"
    # twilio_token = "5994e565f9bf70f5f247f6177bdbfa93"
    # twilio_phone_number = "2016764649"

    # @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    # @twilio_client.account.sms.messages.create(
    #   from: '+14196054656',
    #   :to => "+919986895741",
    #   :body => "This is an message. It gets sent to Tinkesh")


   
   # ActionMailer delivery
# sms_fu = SMSFu::Client.configure(:delivery => :action_mailer)

# sms_fu.deliver("+919162485029","at&t","hello world")
  end
end
