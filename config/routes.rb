Iwakfu::Application.routes.draw do
  root "home#index"
  match 'search', to: 'home#search', via: :all
  resources :items
  resources :item_sets
  resources :recipes
  resources :item_details
  resources :item_builds do
    collection do
      get 'show_build'
    end
    
    member do
      get 'add_item'
    end
  end
  
  resources :mobs
  resources :mob_families
  namespace :admin do
    resources :items
    resources :item_types
  end
end
