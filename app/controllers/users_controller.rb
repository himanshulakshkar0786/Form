class UsersController < ApplicationController

	def posts
		@user = User.find(params[:id])
		render 'posts'
	end

	def show
		@user = User.find(params[:id])
	end

private

	def user_params
		params.require(:user).permit(:name, :image, :gender)
	end

end