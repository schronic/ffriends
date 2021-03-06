Rails.application.routes.draw do
  root to: 'friends#index'

  devise_for :users

  resources :arenas, only:[:show, :index] do
    resources :fights, except: [:edit, :update]
  end

  resources :friends

  resources :friends do
    resources :reviews
  end

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
  delete '/cart/:id',      to: 'reservations#destroy',as: 'delete_reservation'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
