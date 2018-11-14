Rails.application.routes.draw do
  root to: 'friends#index'

  devise_for :users
  resources :friends
  resources :purchases, except: [:edit, :update]
  resources :users, only: [:show]
  # resources :reservations
  # resources :cart, controller: 'reservations', path: 'cart'
  get    '/cart',          to: 'reservations#index',  as: 'cart'
  post   '/cart',          to: 'reservations#create', as: 'create_reservation'
  get    '/cart/new',      to: 'reservations#new',    as: 'new_reservation'
  get    '/cart/:id/edit', to: 'reservations#edit',   as: 'edit_reservation'
  get    '/cart/:id',      to: 'reservations#show',   as: 'reservation'
  patch  '/cart/:id',      to: 'reservations#update'
  put    '/cart/:id',      to: 'reservations#update'
  delete '/cart/:id',      to: 'reservations#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
