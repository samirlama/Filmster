class VotesController < ApplicationController
	def create

		@review = Review.find(params[:review_id])
		@movie = @review.movie
		@user = @review.user
		@vote = @review.votes.create(user_id: current_user.id)
		Notification.create(voted_id:@user.id , voter_id: current_user.id , event: "like" , status: "read")
		respond_to do |format|
			format.html {redirect_to movie_path(@movie.id)}
			format.js { render :layout => false }
		end	
		
	
	
		


	end	
	def destroy
		@review = Review.find(params[:review_id])
		@user = @review.user
		@movie = @review.movie
		@vote  = @review.votes.find_by(user_id: params[:user_id])
		@vote.destroy
		@notification_del = Notification.find_by(voted_id: @user.id , voter_id: current_user.id)
		@notification_del.destroy
		respond_to do |format|
			format.html {redirect_to movie_path(@movie.id)}
			format.js { render :layout => false }
		end	
		
	end	
end
