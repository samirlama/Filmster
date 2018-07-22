class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :following_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
has_many :followed_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent: :destroy
has_many :following_users, through: :following_relationships, source: :followed
has_many :followed_users, through: :followed_relationships, source: :follower
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :reviews
   has_many :votes
   has_many :ratings
   has_many :voted_notification , class_name: "Notification" , foreign_key: "voted_id" , dependent: :destroy
   has_many :voting_notification , class_name: "Notification" , foreign_key: "voter_id" , dependent: :destroy
   
   def reviewed?(movie)
		reviews.exists?(movie_id: movie.id)
   end 
	def follow(other_user)
    following_relationships.create(followed_id: other_user.id)
   end 
  
  def unfollow(other_user)
    following_relationships.find_by(followed_id: other_user.id).destroy
   end 
  
  
  def following?(user)
    return true if following_relationships.exists?(followed_id: user.id)
  end  
  def voted?(review)
    votes.exists?(review_id: review.id)
  end 
   

        
end
