class RatingBuilder
	def initialize(movie_id: , rate_number: , user_id:)
		@rate_number = rate_number
		@movie_id = movie_id
		@user_id = user_id
		@rating = Rating.find_or_initialize_by(movie_id: @movie_id , user_id: @user_id)
	end	
	def build!
		@rating.rate_number =  @rate_number
		@rating.user_id = @user_id
		@rating.movie_id = @movie_id
		@rating.save!
		return @rating

	end	
end	