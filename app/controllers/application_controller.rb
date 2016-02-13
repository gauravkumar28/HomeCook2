class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :add_bucket
  
  after_filter :store_location
  def add_bucket
    unless params["source"] == "mobile"
      #session.delete(:cart_id)
      cart_id = session[:cart_id]
      if session[:cart_id]
        begin
          @cart = Cart.find(cart_id)
        rescue => e

          @cart =Cart.create
        end
      else
         @cart = Cart.create
      end
      #@cart = session[:cart_id] ? Cart.find(cart_id) : Cart.create


      session[:cart_id] = @cart.id
    end
  end

  def after_sign_in_path_for(resource)
    unless current_admin_user
      session[:return_to] || root_path 
    else
      root_path
    end
  end

  def after_sign_up_path_for(resource)
    @cart.destroy
    session[:return_to] || root_path
  end

  def redirect_to(options = {}, response_status = {})
    if request.xhr?
      render(:update) {|page| page.redirect_to(options)}
    else
      super(options, response_status)
    end
  end

  def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
  return unless request.get? 
  if (request.path != "/users/sign_in" &&
      request.path != "/users/sign_up" &&
      request.path != "/users/password/new" &&
      request.path != "/users/password/edit" &&
      request.path != "/users/confirmation" &&
      request.path != "/users/sign_out" &&
      !request.xhr?) # don't store ajax calls
    session[:return_to] = request.fullpath 
  end
end

end
