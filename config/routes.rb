Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/show'
  get 'reservations/new'
  get 'reservations/create'
  get 'reservations/edit'
  get 'reservations/update'
  get 'reservations/destroy'
  root to: 'friends#index'
  devise_for :users
  resources :friends, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :purchases, except: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
