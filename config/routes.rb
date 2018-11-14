Rails.application.routes.draw do
  root to: 'friends#index'

  devise_for :users
  resources :friends, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :purchases, except: [:edit, :update]
  resources :reservations
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
