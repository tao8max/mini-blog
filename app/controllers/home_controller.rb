class HomeController < ApplicationController
	
	def index
	end

	def search
		@users = User.where(email: params[:query])
	end

end
