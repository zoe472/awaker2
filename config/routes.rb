Rails.application.routes.draw do
  devise_for :users 
  root to: 'tweets#index'
  namespace :tweets do
    resources :searches, only: :index
  end
  resources :searches, only: :index
  resources :users do
    member do
      get 'like'
      get 'home'
    end
  end

  resources :quests, only: [:new, :create, :show, :destroy] do
    resources :brands
  end
  namespace :admin do
    resources :users
  end
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
end
