Rails.application.routes.draw do
  devise_for :users
  devise_for :realtors
  root to: 'home#index'
  resources :properties, only: [:show, :new, :create, :index, :edit, :update] do
    resources :proposals, only: [:new, :create, :show]
  end
  resources :property_types, only: [:show, :new, :create]
  resources :regions, only: [:show, :new, :create]
  resources :proposals, only: [:index]
  
  get '/search_region', to: 'regions#search'
end
