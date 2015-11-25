Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :articles, only: [:index, :show]
  resources :breeders, only: [:index, :show]
  resources :canines, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :tournaments, only: [:index, :show]
  resources :animations, only: [:index, :show]
  resources :champions, only: [:index, :show]

  match 'home/send_mail', to: 'home#send_mail', via: 'post'
  match 'home/create_metter', to: 'home#create_metter', via: 'post'
  get "home/contactus", to:"home#contactus"
  get "home/metter", to:"home#metter", as: "metter"
  get "home/search_canines" => 'home#search_canines', :as => "search_canines"
  get "canines/:id/endogamia", to:"canines#endogamia", as: "endogamia"
  get "canines/:id/pedigree", to:"canines#pedigree", as: "pedigree"
  get "canines/:id/childrens", to:"canines#childrens", as: "childrens"
  get "canines/:id/mergecanines", to:"canines#mergecanines", as: "mergecanines"
  get "canines/:id/calculate_endogamia", to:"canines#calculate_endogamia", as: "calculate_endogamia"
  get "canines/:id/pedigree_complex", to:"canines#pedigree_complex", as: "pedigree_complex"
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
    resources :grades
    resources :standards
    resources :sponsors
    resources :type_breeders
    resources :type_championships
    resources :type_events
    resources :videos
    resources :characteristics
    resources :canino_characteristics
    resources :animations
    resources :characteristics
    post "characteristics/sort", to: "characteristics#sort"
    get "characteristics/:id/options", to:"characteristics#options", as: "options"
    match 'home/send_mail_attachments', to: 'home#send_mail_attachments', via: 'post'
    put "canino_characteristics/:id/approve", to: "canino_characteristics#approve", as: "approve"
    get "home/send_email" => 'home#send_email', :as => "send_email"
    get "home/search_canines" => 'home#search_canines', :as => "search_canines"
    get "canines/:id/calculate_endogamia", to:"canines#calculate_endogamia", as: "calculate_endogamia"
    get "canines/:id/pedigree_complex", to:"canines#pedigree_complex", as: "pedigree_complex"
    get "canines/:id/childrens", to:"canines#childrens", as: "childrens"
    get "canines/:id/mergecanines", to:"canines#mergecanines", as: "mergecanines"
    get "canines/:id/pedigree", to:"canines#pedigree", as: "pedigree"
    get "canines/:id/endogamia", to:"canines#endogamia", as: "endogamia"
    put "canino_characteristics/:id/update_metter", to: "canino_characteristics#update_metter", as: "update_metter"
    put "comments/:id/change_status", to: "comments#change_status", as: "change_status_comments"
    put "sponsors/:id/change_status", to: "sponsors#change_status", as: "change_status"
  end

end
