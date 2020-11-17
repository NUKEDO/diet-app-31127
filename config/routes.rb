Rails.application.routes.draw do
  devise_for :users
  root to: 'records#index'
  resources :records, only: :index
  resources :methods, only: [:new, :create]
end
