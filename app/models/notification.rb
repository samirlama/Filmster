class Notification < ApplicationRecord 

	validates :voted , :voter , presence: true
	validates :voted_id , uniqueness: {scope: :voter_id}
belongs_to :voted ,class_name: "User" #voted = user whose review is liked
belongs_to :voter,class_name: "User" #voter = user who likes review
enum status: {read: 0 , unread: 1}
enum  event: {like: 0 , comment: 1 }

end

	
