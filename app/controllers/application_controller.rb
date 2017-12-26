class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :username, :password, :password_confirmation, :date_of_birth, :country_id, :state_id, :contact, :city_id])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :username, :email, :login, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :username, :date_of_birth, :contact, :country_id, :state_id, :city_id])
  end

end