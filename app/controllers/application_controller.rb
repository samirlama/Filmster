class ApplicationController < ActionController::Base
	helper_method  :notification_like 
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username,:email, :password, :password_confirmation ) }
  devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username,:email, :password, :password_confirmation, :current_password,:avatar) }
end
def after_sign_in_path_for(resource_or_scope)
  root_path
end

def after_sign_out_path_for(resource_or_scope)
  new_user_session_path
end
 
 def notification_like
 	Notification.where(voted_id: current_user.id , status: 'read' , event: 'like')
 end	

end
