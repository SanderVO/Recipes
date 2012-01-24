class ApplicationController < ActionController::Base
	include ControllerAuthentication
  protect_from_forgery
  helper_method :current_user

  def authenticate
    redirect_to signin_path unless current_user
  end

	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
end
