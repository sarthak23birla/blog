Rails.application.routes.draw do
  root 'categories#index'
  resources :articles do
  	member do
  		resources :comments, only: :create
  	end
  end
  resources :categories
  devise_for :users ,:controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  get 'auth/login'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
