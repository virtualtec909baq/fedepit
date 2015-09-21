Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :category_championships
  resources :varieties
  resources :scores
  resources :shows
  resources :entities
  resources :articles, only: [:index, :show]
  resources :breeders, only: [:index, :show]
  resources :canines, only: [:index, :show]
  resources :championships, only: [:index]
  resources :events, only: [:index]
  resources :videos, only: [:index, :show]
  
  match 'home/send_mail', to: 'home#send_mail', via: 'post'
  get :index2, to: 'canines#index2', as: :index2
  get :realizarcruce, to: 'canines#realizarcruce', as: :realizarcruce
  get :merge_canine, to: 'canines#merge_canine', as: :merge_canine
  get "home/contactus", to:"home#contactus"
  get "home/sumula" => "home#sumula"
  get "canines/:id/mergecanines", to:"canines#mergecanines", as: "mergecanines"
  put "articles/:id/denounce", to: "articles#denounce", as: "denounce"
  
  namespace :api, defaults: { format: :xml } do
    resources :canines, only: [:index, :show]
  end
  
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
    resources :paragraphs
    resources :type_categories
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
    resources :characteristics
    resources :canino_characteristics
    
    match 'breeders/send_mail_attachments', to: 'breeders#send_mail_attachments', via: 'post'
    get "home/:id/mergecanines", to:"home#mergecanines", as: "mergecanines"
    get "canines/:id/pedigree", to:"canines#pedigree", as: "pedigree"
    get "canines/:id/endogamia", to:"canines#endogamia", as: "endogamia"
    get "home/realizarcruce", to:"home#realizarcruce", as: "realizarcruce"
    put "canino_characteristics/:id/update_metter", to: "canino_characteristics#update_metter", as: "update_metter"
    put "comments/:id/change_status", to: "comments#change_status", as: "change_status_comments"
    put "sponsors/:id/change_status", to: "sponsors#change_status", as: "change_status"
    put "publicities/:id/change_status", to: "publicities#change_status", as: "change_status_publicities"
    post "home/enviar_cruce", to: "home#enviar_cruce", as: "enviar_cruce"
  end

end
