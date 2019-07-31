class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?


	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) do |user|
			user.permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
		end
	end

	def set_cache_headers
		response.headers["Cache-Control"] = "no-cache, no-store"
		response.headers["Pragma"] = "no-cache"
		response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
	end
end
