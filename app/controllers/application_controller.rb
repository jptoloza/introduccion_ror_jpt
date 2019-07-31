class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception
	rescue_from CanCan::AccessDenied do |exception|
		redirect_to new_user_session_path, :alert => exception.message
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) do |user|
			user.permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
		end
		devise_parameter_sanitizer.permit(:account_update) do |user|
			user.permit(:first_name, :last_name, :email, :username, :current_password)
		end
	end

	def set_cache_headers
		response.headers["Cache-Control"] = "no-cache, no-store"
		response.headers["Pragma"] = "no-cache"
		response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
	end
end
