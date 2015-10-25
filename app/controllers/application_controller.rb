class ApplicationController < ActionController::Base
	def current_user
		if session[:user_id]
			@current_user=User.find(session[:user_id])
		end
	end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user
  protect_from_forgery with: :exception
end
