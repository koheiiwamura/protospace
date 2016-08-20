Rails.application.routes.draw do
  devise_for :users
  resources :users , only: [:show, :edit, :update]
  root 'prototypes#index'
  resources :prototypes
end
