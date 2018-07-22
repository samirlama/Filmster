json.reviews do 
	json.array! @reviews do |review|
		json.movie review.movie ,:title , :poster
		json.comment review.comment
		json.user review.user.username
	end	

	
end