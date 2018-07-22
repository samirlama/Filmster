class StaticPagesController < ApplicationController
	def index 
		@movies = Tmdb::Movie.top_rated
		@recent_reviews = Review.recent
	end
	
end
