Rails.application.routes.draw do
  devise_for :users
  devise_for :realtors
  root to: 'home#index'
  resources :properties, only: [:show, :new, :create, :index, :edit, :update] do
    resources :proposals, only: [:new, :create, :show] do
      post 'reject', on: :member
    end
  end
  resources :property_types, only: [:show, :new, :create, :index, :edit, :update]
  resources :regions, only: [:index, :show, :new, :create, :edit, :update]
  resources :proposals, only: [:index]
  resources :realtors, only: [:index]
  resources :price_ranges, only: [:index, :new, :create, :show]

  
  get '/search_region', to: 'regions#search'
end
