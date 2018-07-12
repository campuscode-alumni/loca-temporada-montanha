Rails.application.routes.draw do
  root to: 'home#index'
  resources :properties, only: [:show, :new, :create]
  resources :property_types, only: [:show, :new, :create]
  resources :regions, only: [:show, :new, :create]
  resources :proposals
  get '/search_region', to: 'regions#search'
end
