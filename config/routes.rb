Rails.application.routes.draw do
  devise_for :users
  resources :users , only: [:show, :edit, :update]
  root 'prototypes#index'
  resources :prototypes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end
end
