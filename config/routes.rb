Iwakfu::Application.routes.draw do
  root "home#index"
  match 'search', to: 'home#search', via: :all
  resources :items
  resources :item_sets
  resources :recipes
  
  resources :mobs
  resources :mob_families
  namespace :admin do
    resources :items
    resources :item_types
  end
end
