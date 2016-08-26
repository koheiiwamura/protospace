Rails.application.routes.draw do
  devise_for :users
  resources :users , only: [:show, :edit, :update]
  root 'prototypes#index'
  namespace :prototypes do
    resources :newest ,only: [:index]
    resources :popular ,only: [:index]
  end
  resources :prototypes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end
end
