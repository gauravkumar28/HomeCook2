class Users::SessionsController < Devise::SessionsController
before_filter :configure_sign_in_params, only: [:create]

  #GET /resource/sign_in
  respond_to :js, :html
  def new
    super
  end

  #POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    if resource && resource.active_for_authentication?
      #set_flash_message(:notice, :signed_in) 
      sign_in(resource_name, resource)
      render :js => "window.location = '#{session[:return_to]}'" and return
    else
      
    end
  end

  #DELETE /resource/sign_out
  def destroy
    super
  end

  def failure
    respond_to do |format|
      format.js { render:json => {:success => false, :errors => ["Login failed."]} }
    end
  end

  protected

  #If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    #devise_parameter_sanitizer.for(:sign_in) << :attribute
  end
end
