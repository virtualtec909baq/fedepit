Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :articles, only: [:index, :show]
  resources :breeders, only: [:index, :show]
  resources :canines, only: [:index, :show]
  resources :championships, only: [:index]
  resources :events, only: [:index]
  resources :videos, only: [:index]
  match 'home/send_mail', to: 'home#send_mail', via: 'post'
  get "home/contactus", to:"home#contactus"
  get "home/sumula" => "home#sumula"
  put "articles/:id/denounce", to: "articles#denounce", as: "denounce"

  namespace :admin do
    get "home/index", to:"home#index"
    get "breeders/send_email", to:"breeders#send_email"
  	resources :articles
    resources :breeders
    resources :canines do
      get :autocomplete_canine_name, :on => :collection
      get :autocomplete_canine_lof, :on => :collection
      resources :images, :only => [:create, :destroy, :update]
    end
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
    
    match 'breeders/send_mail_attachments', to: 'breeders#send_mail_attachments', via: 'post'
    get "home/:id/mergecanines", to:"home#mergecanines", as: "mergecanines"
    get "canines/:id/pedigree", to:"canines#pedigree", as: "pedigree"
    get "home/realizarcruce", to:"home#realizarcruce", as: "realizarcruce"
    put "comments/:id/change_status", to: "comments#change_status", as: "change_status_comments"
    put "sponsors/:id/change_status", to: "sponsors#change_status", as: "change_status"
    put "publicities/:id/change_status", to: "publicities#change_status", as: "change_status_publicities"
    post "canines/awards", to: "canines#awards", as: "awards"
    post "home/enviar_cruce", to: "home#enviar_cruce", as: "enviar_cruce"
  end

end
