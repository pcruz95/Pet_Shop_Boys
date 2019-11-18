class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name address description photo photo_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name address description photo photo_cache])
  end
end
