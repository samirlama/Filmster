module NotificationsHelper
	def time_frame(time_now , time_created_at)
		@diff = time_now - time_created_at
		
		if @diff == 1
			@a = 'Just now'
			return @a 
		end	
		if @diff > 1 && @diff < 60
			@a = '#{@diff} second ago'
			return @a
		end	
		if @diff > 60 
			@min = @diff/60
			@hour = @min/60
			@day = @hour/24
			
			if @min >= 1 && @min < 60 
				@a = @min.to_s + 'minute ago'
				return @a
			end
			if @hour >= 1 && @hour > 24
				@a = '#{@hour} hour ago'
				return @a
			end
			if @day >= 1 && @day < 7
				@a = '#{@day} day ago'
				return @a
			end
		end	


	end 
end
