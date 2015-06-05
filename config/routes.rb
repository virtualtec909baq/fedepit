Rails.application.routes.draw do
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
    resources :features

    get "canines/:id/pedigree", to:"canines#pedigree", as: "pedigree"
    put "comments/:id/change_status", to: "comments#change_status", as: "change_status_comments"
    put "sponsors/:id/change_status", to: "sponsors#change_status", as: "change_status"
    put "publicities/:id/change_status", to: "publicities#change_status", as: "change_status_publicities"
  end

end
