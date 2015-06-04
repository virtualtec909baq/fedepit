Rails.application.routes.draw do

  resources :features
  root 'home#index'
  devise_for :users
  resources :articles, only: [:index, :show]
  resources :breeders, only: [:index, :show]
  resources :canines, only: [:index]
  resources :championships, only: [:index]
  resources :events, only: [:index]
  resources :videos, only: [:index]
  get "home/contactus", to:"home#contactus"
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
    resources :type_championships
    resources :type_events
    resources :videos
    put "sponsors/:id/change_status", to: "sponsors#change_status", as: "change_status"
    put "publicities/:id/change_status", to: "publicities#change_status", as: "change_status_publicities"
  end

end
