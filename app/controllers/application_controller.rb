class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :add_bucket
  #after_filter :store_location
  def add_bucket
    cart_id = session[:cart_id]
    @cart = session[:cart_id] ? Cart.find(cart_id) : Cart.create
    session[:cart_id] = @cart.id
  end

  def after_sign_in_path_for(resource)
    #session.clear
    session[:return_to] || root_path
  end

  def after_sign_up_path_for(resource)
    session[:return_to] || root_path
  end

  def redirect_to(options = {}, response_status = {})
  if request.xhr?
    render(:update) {|page| page.redirect_to(options)}
  else
    super(options, response_status)
  end
end

end
