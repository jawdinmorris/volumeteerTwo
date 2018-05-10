class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name business_name bio phone street city country postcode chosen_role image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name business_name bio phone street city country postcode chosen_role image])
  end
end
