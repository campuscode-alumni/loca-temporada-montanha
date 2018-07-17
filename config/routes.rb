Rails.application.routes.draw do
  devise_for :users
  devise_for :realtors
  root to: 'home#index'
  resources :properties, only: [:show, :new, :create, :index, :edit, :update] do
    resources :proposals, only: [:new, :create, :show]
  end
  resources :property_types, only: [:show, :new, :create]
  resources :regions, only: [:index, :show, :new, :create, :edit, :update]
  resources :proposals, only: [:index]
<<<<<<< HEAD
  #resources :realtors, only: [:index]
=======
  resources :realtors, only: [:index]
>>>>>>> 495bdecaba7179bcabb984b0a8778d03d3d283df

  
  get '/search_region', to: 'regions#search'
end
