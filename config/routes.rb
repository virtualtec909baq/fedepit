Rails.application.routes.draw do
  
  resources :type_breeders
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
  resources :breeders, only: [:index]
  resources :canines, only: [:index]
  resources :championships, only: [:index]

  namespace :admin do
  	get 'home/index'
  	resources :articles
    resources :breeders
    resources :canines
    resources :championships
    resources :colors
  end

end
