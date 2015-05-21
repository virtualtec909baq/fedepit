Rails.application.routes.draw do
  
  resources :comments
  root 'home#index'
  devise_for :users
  resources :articles, only: [:index]
  
  namespace :admin do
  	get 'home/index'
  	resources :articles
  end

end
