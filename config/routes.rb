Rails.application.routes.draw do

  root to: 'home#start'
  
  resources :casas, only: [:index, :show, :create]
  resources :fuerzas, only: [:index, :show, :create]
  resources :heroes, only: [:index, :show, :create]
end
