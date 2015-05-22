Rails.application.routes.draw do
  
  
  resources :type_championships
  resources :type_events
  resources :videos
  root 'home#index'
  devise_for :users
  resources :articles, only: [:index]
  resources :breeders, only: [:index]
  resources :canines, only: [:index]
  resources :championships, only: [:index]
  resources :events, only: [:index]

  namespace :admin do
  	get 'home/index'
  	resources :articles
    resources :breeders
    resources :canines
    resources :championships
    resources :colors
    resources :comments
    resources :events
    resources :publicities
    resources :races
    resources :sponsors
    resources :type_breeders
  end

end
