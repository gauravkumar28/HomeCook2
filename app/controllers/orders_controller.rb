class OrdersController < ApplicationController
  #before_filter :login_required
  def create
    if params[:shipping_address].present?
      address = current_user.shipping_address
      @order = Order.new(address1: address.addrss1, address2: address.address2, landmark: address.landmark, phone: address.phone, location_id: session[:location_id], user_id: current_user.id, time: params[:order][:time], summery: params[:order][:summery], price: params[:order][:price])
      if @order.save 
  	    flash[:success] = "Order Placed Successfully"
        send_message
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
          flash[:success] = "Order Placed Successfully"
          @cart.clear
          redirect_to chefs_path
    	  else
    		  flash[:error] = "Order Not Placed Try Again"
    		  redirect_to :back
        end
      else
        if @order.save 
        send_message
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
    session.delete(:return_to)
    if @cart.total == 0
      flash[:notice] = "Your Cart is Empty. Add Items And Proceed"
      redirect_to :back and return
    end
    @order = Order.new
  end
  
  def destroy
    @order = Order.find_by_id(params[:id])
    user_id = @order.user_id
    @order.destroy
    redirect_to home_index_path({id: user_id})
  end

  def update
    @order = Order.new(params[:order])
    if @order.save
      redirect_to home_index_path({id: @order.user_id})
    else
      redirect_to :back
    end
  end
  
  def edit
    @order = Order.find_by_id(params[:id] )
  end

  def apply_coupan
    @coupan = Coupan.find_by_code(params[:coupon_code])

    if @coupan
      @discount = @coupan.discount if @coupan.discount_type == 'absolute'
      @discount = ((@cart.total  *  @coupan.discount)/100).to_i if @coupan.discount_type == 'percent'
    else @coupan
      @error = true
      flash[:notice] = 'Invalid Coupan'
    end
  end

  def login_required
  	unless current_user
      session[:return_to] = request.fullpath
      render :js => "window.location = #{new_user_session_path.to_json}"
    end
  end

  def send_message
    begin
      twilio_sid = "ACb144919d3af4655207b682f28d3882a9"
      twilio_token = "5994e565f9bf70f5f247f6177bdbfa93"
      twilio_phone_number = "2016764649"

      @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
      @twilio_client.account.sms.messages.create(
        from: '+14196054656',
        :to => "+91" + @order.phone.to_s,
        :body => "Hi Your Order Placed")
    rescue => e
      flash[:error] = "Something went wrong Try Again!"
      redirect_to :back
    end
  end
end
