Iwakfu::Application.routes.draw do
  root "home#index"
  resources :items
  resources :mobs
  resources :mob_families
  namespace :admin do
    resources :items
  end
end
