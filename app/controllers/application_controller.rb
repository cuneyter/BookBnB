class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :flat_owner])
    devise_parameter_sanitizer.permit(:account_uptade, keys: [:first_name, :last_name, :flat_owner])
  end
end
