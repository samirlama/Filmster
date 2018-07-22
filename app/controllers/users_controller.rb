class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@relation = Relationship.find_by(followed_id: @user.id , follower_id: current_user.id)
		@movies = Movie.all
	end	
	def timeline
		@reviews = Review.where(user: current_user.following_users)
	end
	
end
