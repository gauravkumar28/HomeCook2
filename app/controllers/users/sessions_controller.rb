class Users::SessionsController < Devise::SessionsController
before_filter :configure_sign_in_params, only: [:create]

  #GET /resource/sign_in
  respond_to :js, :html
  def new
    super
  end

  #POST /resource/sign_in
  def create
    unless params[:api]
      self.resource = warden.authenticate!(auth_options)
      if resource && resource.active_for_authentication?
        #set_flash_message(:notice, :signed_in) 
        sign_in(resource_name, resource)
        redirect_to :back
        #render :js => "window.location = '#{session[:return_to]}'" and return
      else
        
      end
    else
       self.resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
       render :status => 200,
           :json => { :success => true,
                      :info => "Logged in" }
    end
  end

  #DELETE /resource/sign_out
  def destroy
    unless params[:api]
      super
    else
      warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    #current_user.update_column(:authentication_token, nil)
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged out",
                      :data => {} }
    end
  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
  end

  protected

  #If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    #devise_parameter_sanitizer.for(:sign_in) << :attribute
  end
end
