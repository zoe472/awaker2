Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  namespace :tweets do
    resources :searches, only: :index
  end
  resources :searches, only: :index
  resources :users
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
  
end
