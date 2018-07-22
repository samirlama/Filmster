class RatingsController < ApplicationController
	def create
		@movie_id = params[:movie_id]
		@rate_number = params[:rate_number]
		@rating = RatingBuilder.new(movie_id: @movie_id , rate_number: @rate_number , user_id: current_user.id ).build!
	end	
end