class Users::RegistrationsController < Devise::RegistrationsController
#before_filter :configure_sign_up_params, only: [:create]
#before_filter :configure_account_update_params, only: [:update]

  #GET /resource/sign_up

  respond_to :js, :html, :json
  def new
    super
   # resource ||= User.new()
  end

  #POST /resource
  def create
    unless params[:api]
      @user = User.new(params[:user])
      if @user.save
        # code = rand(0000..9999).to_s.rjust(4, "0")
        # send_sms(@user.phone, code)
        sign_in @user
        #flash[:notice] = 'Signned Up Successfully!'
        redirect_to :back
        #render :js => "window.location = '#{session[:return_to]}'" and return
      end
    else
      @user = User.new(params[:user])
      if @user.save
        # code = rand(0000..9999).to_s.rjust(4, "0")
        # send_sms(@user.phone, code)
        sign_in @user
        #flash[:notice] = 'Signned Up Successfully!'
        render status: 200, json: @user
      
      else
        render status: 404, json: {error: "signup failed"}
      end
    end
  end

  #GET /resource/edit
  def edit
    super
  end

  #PUT /resource
  def update
    super
  end

  #DELETE /resource
  def destroy
    super
  end

  def verify
    user = User.find(params[:id])
    if user.VerificationCode == params[:pin]
      user.VerificationStatus = 'done'
      user.save!
      redirect_to root_path
    else
      redirect_to :back
    end
  end
  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

  #If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :phone
  end

  #If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :attribute
  end

  #The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  #The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

  def send_sms(phone, msg)
    puts 'hi'
  end
end
