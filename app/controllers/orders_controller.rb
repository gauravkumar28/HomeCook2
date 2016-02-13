class OrdersController < ApplicationController
  #before_filter :login_required
  def create
    if params[:shipping_address].present?
      address = current_user.shipping_address
      @order = Order.new(address1: address.addrss1, address2: address.address2, landmark: address.landmark, phone: address.phone, location_id: session[:location_id], user_id: current_user.id, time: params[:order][:time], summery: params[:order][:summery], price: params[:order][:price], status: params[:order][:status], instruction: params[:order][:instruction])
      @order.created_at = Time.now.in_time_zone('Mumbai')
      if @order.save 
  	    flash[:success] = "Order Placed Successfully"
        send_message
        @cart.clear
        redirect_to home_index_path({id: current_user.id})
      else
        #flash[:error] = "Order Not Placed Try Again"
        render :action => "new"
      end
    else
      @order = Order.new(params[:order])
      @order.created_at = Time.now.in_time_zone('Mumbai')
      @order.location_id = session[:location_id]
      if current_user
          @order.user_id = current_user.id
        if @order.save
          @order.update_attributes(created_at: Time.now.in_time_zone('Mumbai'))
          if current_user.shipping_address.present? 
            current_user.shipping_address.update_attributes(addrss1: params[:order][:address1], address2: params[:order][:address2], landmark: params[:order][:landmark], phone: params[:order][:phone])
          else
            shipping_address = ShippingAddress.new(addrss1: params[:order][:address1], address2: params[:order][:address2], landmark: params[:order][:landmark], phone: params[:order][:phone])
            shipping_address.user_id = current_user.id
            shipping_address.save!
          end
          flash[:success] = "Order Placed Successfully"
          @cart.clear
          redirect_to home_index_path({id: current_user.id})
    	  else
    		  #flash[:error] = "Order Not Placed Try Again"
    		  render :action => 'new'
        end
      else
        if @order.save 
          @order.update_attributes(created_at: Time.now.in_time_zone('Mumbai'))
          send_message
          flash[:success] = "Order Placed Successfully"
          @cart.clear
          redirect_to home_index_path({id: current_user.id})
        else
          #flash[:error] = "Order Not Placed Try Again"
          render :action => 'new'
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
    @discount =  params[:discount]
    @order = Order.new
    @order.instruction = params[:instruction]
  end
  
  def destroy
    @order = Order.find_by_id(params[:id])
    user_id = @order.user_id
    @order.destroy
    redirect_to home_index_path({id: user_id})
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
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
      discount = @coupan.discount if @coupan.discount_type == 'absolute'
      discount = ((@cart.total  *  @coupan.discount)/100).to_i if @coupan.discount_type == 'percent'
      @coupan.applied += 1
    else @coupan
      @error = true
      flash[:notice] = 'Invalid Coupan'
    end
    redirect_to new_order_path({:discount => discount})
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
        :body => "Hi Your Ordered #{@order.summery} at #{@order.time}")
      @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
      # @twilio_client.account.sms.messages.create(
      #   from: '+14196054656',
      #   :to => "+91" + Order.ADMIN_CONTACT_NUMBER.to_s,
      #   :body => "Hi new order #{@order.summery} at #{@order.time}")
    rescue => e
      flash[:error] = "Something went wrong Try Again!"
      redirect_to :back
    end
  end

  def get_coupan
    @coupan = Coupan.find_by_code(params[:coupon_code])
    if @coupan
      discount = @coupan.discount if @coupan.discount_type == 'absolute'
      discount = ((@cart.total  *  @coupan.discount)/100).to_i if @coupan.discount_type == 'percent'
      @coupan.applied += 1
      render status: 200, json: discount
    else @coupan
      render status: 200, json: 0
    end
  end

  def create_from_api
    Rails.logger.info "/POST /order with params #{params.inspect}"
    begin
      user = User.where(email: params["email"]).first
      render status: 400, json: {error: "User not found" } if user.nil? and return
      @order = Order.new(address1: params["order"]["address1"], address2: params["order"]["address2"], landmark: params["order"]["landmark"], phone: params["order"]["phone"], location_id: params["order"]["location"], user_id: user.id, time: params["order"]["time"], summery: params["order"]["summery"], price: params["order"]["price"], status: params["order"]["status"], instruction: params["order"]["instruction"])
      @order.created_at = Time.now.in_time_zone('Mumbai')
      if @order.save
        #send_message
        #@cart.clear
          #redirect_to home_index_path({id: current_user.id})
        render status: 200, json: @order.to_json and return
      else
        render status: 400, json: {error: "Order Not Placed Try Again" } and return
      end
    rescue Exception => e
      render status: 422, json: {error: "Order Not Placed Try Again" } and return
    end
  end
end
