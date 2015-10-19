class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << [:name, :last_name, :username]
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }

  	devise_parameter_sanitizer.for(:account_update) do |u|
  		u.permit(:name, :last_name, :username, :email, :password, :pasword_confirmation, :current_password)
  	end
  end
end
