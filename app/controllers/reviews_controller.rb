class ReviewsController < ApplicationController
	before_action :authenticate_user!
	def create
		@movie = MovieBuilder.new(tmdb_id: params[:tmdb_id]).build!
    	
            #create a new review and connect it to the current_user and the movie
    		@review  = current_user.reviews.new(review_params.merge(movie_id: @movie.id))
           

    		if @review.save
    			flash[:notice] = "Review Saved"
    			  redirect_to movie_path(id: @movie.id)
    		else
    			flash[:alert] = "Error occured"
    			redirect_to root_path	
    		end	 
    	end	
        
    	private
    	def review_params
    		params.require(:review).permit(:comment)
    	end		



end
