class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    # Whitelist the following form fields so that we can process them. If coming
    # from a Deivise form.
  before_action :configured_permitted_parameters, if: :devise_controller?

  protected
  def configured_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:stripe_card_token, :email, :password, :password_confirmation) }
  end
end
