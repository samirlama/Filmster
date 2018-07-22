
class NotificationsController < ApplicationController
	include NotificationsHelper

	def index
		
		@notification_review_like = Notification.where(voted_id: current_user.id)
	end	
	def f_request
		@notifications = Relationship.where(followed_id: current_user.id, status: "pending")
		@notifications_alert = Relationship.where(follower_id: current_user.id , status: "accept" )
	end	
end
