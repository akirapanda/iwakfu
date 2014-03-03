Iwakfu::Application.routes.draw do
  root "home#index"
  resources :items
  resources :item_sets
  
  resources :mobs
  resources :mob_families
  namespace :admin do
    resources :items
    resources :item_types
  end
end
