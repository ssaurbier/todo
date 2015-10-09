class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # helper_method :list_finder
  #
  #
  # def list_finder(list)
  #   @list = List.find_by_typ(list)
  #   return @list.id
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :phone_number]
  end

  def logged_in?
    current_user != nil
  end
end
