class ApplicationController < ActionController::Base
  before_action :configure_permited_params, if: :devise_controller?
  protect_from_forgery with: :exception
  
  protected
  def configure_permited_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :usr_type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :usr_type])
  end
end
