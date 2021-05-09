class ApplicationController < ActionController::Base

  before_action :authenticate_account!
  before_action :configure_permited_parameters, if: :devise_controller?

  layout :layout_by_resource

  private

  def layout_by_resource
    "authentication" if devise_controller?
  end

  def configure_permited_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[ name document agency num_account bank_id]
  end

end
