class Relationship < ApplicationRecord
	validates :follower , :followed , presence: true
	validates :followed_id, uniqueness: {scope: :follower_id}
	belongs_to :follower , class_name: "User"
	belongs_to :followed , class_name: "User"
	enum status: {pending: 0, accept: 1 , reject: 2}

	
end
