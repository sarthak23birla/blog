Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
  	member do
  		resources :comments, only: :create
  	end
  end
  resources :categories
  resources :access
  devise_for :users ,:controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  get 'auth/login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
