class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:netid])
	end
end
