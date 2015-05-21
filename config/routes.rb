Rails.application.routes.draw do
  
  resources :videos
  resources :comments
  root 'home#index'
  devise_for :users
  resources :articles, only: [:index]
  
  namespace :admin do
  	get 'home/index'
  	resources :articles
  end

end
