class RelationshipsController < ApplicationController
    before_action :authenticate_user!    
    before_action :check_user
    
  def create 
    current_user.follow(@user)
        #UserMailer.followedMsg(@user, current_user).deliver_now
        
        respond_to do |format|
            format.html { redirect_to user_path(@user.id) }
            format.js {}
        end
    end
    def update
      @relation_update = Relationship.where(followed_id: current_user.id , follower_id: params[:user_id])  
    @relation_update.update(status: params[:status])
    redirect_to user_path(@user)

    end    
    
    def destroy
        current_user.unfollow(@user)
       respond_to do |format|
            format.html { redirect_to user_path(@user.id) }
            format.js {}
        end
    end
    
    private
    def check_user
        @user = User.find(params[:user_id])
    end
end