class ApplicationController < ActionController::Base
  before_action :configure_premitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :resource, :resource_name, :devise_mapping, :check_status

  private

  def configure_premitted_parameters
  	devise_parameter_sanitizer.for(:sign_in) << [:email, :password]
  	devise_parameter_sanitizer.for(:sign_up) << [:email, :password, :password_confirmation]
  	devise_parameter_sanitizer.for(:account_update) << [:email, :age, :gender, :fullname, :familyStatus, :about, :current_password, :new_password, :new_password_confirmation]
  end

  def check_status
    if current_user_incomplete?
      redirect_to edit_user_registration_path
    end
  end

  def current_user_incomplete?
      #[current_user.age, current_user.gender, current_user.fullname, current_user.familyStatus, current_user.about].nil?
    current_user.age.nil?
    current_user.gender.nil?
    current_user.fullname.nil?
    current_user.familyStatus.nil?
    current_user.about.nil?
  end


  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
