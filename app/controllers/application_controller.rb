class ApplicationController < ActionController::API
  respond_to :json
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    default_parameters = %i[username role]
    devise_parameter_sanitizer.permit(:sign_up, keys: default_parameters)
    devise_parameter_sanitizer.permit(:sign_in, keys: default_parameters)
    devise_parameter_sanitizer.permit(:account_update, keys: default_parameters)
  end
end
