Iwakfu::Application.routes.draw do
  mount Iwakfu::API => "/"
  
  root "home#index"
  match 'search', to: 'home#search', via: :all
  resources :items
  resources :item_sets
  resources :recipes
  resources :item_details
  resources :build_shares
  resources :characters
  
  resources :item_builds do
    collection do
      get 'show_build'
      get 'search'
      post 'search'
      
    end
    
    member do
      get 'add_item'
      get 'remove_item'
      get 'share'
      post 'create_share'
    end
  end
  
  resources :mobs
  resources :mob_families
  namespace :admin do
    resources :items
    resources :item_types
    resources :guilds
    
  end
end
