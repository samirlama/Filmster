Rails.application.routes.draw do
  resources :new_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'static_pages#index'
  resources :reviews do 
  	resources :votes , only: [:create , :destroy]
  end	
  resources :movies do 
    resources :ratings , only: [:create]
  end
  resources :users, only: :show do
    resources :relationships, only: [:create, :destroy, :update]

  end

  resources :notifications, only: [:index]
  get 'timeline'=> 'users#timeline'
  get 'f_request' => 'notifications#'
end
