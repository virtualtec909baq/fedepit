Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :articles, only: [:index, :show]
  resources :breeders, only: [:index, :show]
  resources :canines, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :tournaments, only: [:index, :show]
  resources :animations, only: [:index, :show]

  match 'home/send_mail', to: 'home#send_mail', via: 'post'
  get "home/contactus", to:"home#contactus"
  get "canines/:id/endogamia", to:"canines#endogamia", as: "endogamia"
  get "canines/:id/pedigree", to:"canines#pedigree", as: "pedigree"
  put "articles/:id/denounce", to: "articles#denounce", as: "denounce"
  
  namespace :api, defaults: { format: :json } do
    resources :canines, only: [:index, :show]
  end
  
  namespace :admin do
    resources :canines do
      get :autocomplete_canine_name, :on => :collection
      get :autocomplete_canine_lof, :on => :collection
      resources :images, :only => [:create, :destroy, :update]
    end
    resources :champions
    resources :positions
    resources :spectacles
    resources :category_race_varieties
    resources :articles
    resources :breeders
    resources :varieties
    resources :categories
    resources :tournaments
    resources :paragraphs
    resources :type_categories
    resources :colors
    resources :comments
    resources :events
    resources :publicities
    resources :races do 
      resources :img_races
    end
    resources :sponsors
    resources :type_breeders
    resources :type_championships
    resources :type_events
    resources :videos
    resources :characteristics
    resources :canino_characteristics
    resources :animations
    
    match 'breeders/send_mail_attachments', to: 'breeders#send_mail_attachments', via: 'post'
    get "breeders/send_email", to:"breeders#send_email"
    get "home/:id/mergecanines", to:"home#mergecanines", as: "mergecanines"
    get "canines/:id/pedigree", to:"canines#pedigree", as: "pedigree"
    get "canines/:id/endogamia", to:"canines#endogamia", as: "endogamia"
    get "home/realizarcruce", to:"home#realizarcruce", as: "realizarcruce"
    put "canino_characteristics/:id/update_metter", to: "canino_characteristics#update_metter", as: "update_metter"
    put "comments/:id/change_status", to: "comments#change_status", as: "change_status_comments"
    put "sponsors/:id/change_status", to: "sponsors#change_status", as: "change_status"
    post "home/enviar_cruce", to: "home#enviar_cruce", as: "enviar_cruce"
  end

end
