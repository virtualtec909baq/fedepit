Rails.application.routes.draw do
  
  resources :championships
  resources :type_championships
  resources :sponsors
  resources :events
  resources :type_events
  resources :races
  resources :publicities
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
