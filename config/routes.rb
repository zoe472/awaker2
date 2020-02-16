Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :searches, only: :index
  resources :tweets
  resources :users
end
