Rails.application.routes.draw do
  devise_for :users
  root to: 'users/profiles#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'catalogs', to: 'catalogs#index'
  get 'catalogs/:id', to: 'catalogs#show'
  post 'catalogs', to: 'catalogs#create'
  delete 'catalogs/:id', to: 'catalogs#destroy'
  get 'catalog/new', to: 'catalogs#new'

  get 'cart', to: 'carts#index'
  get 'cart/purchase', to: 'carts#purchase'
  get 'cart/checkout', to: 'carts#checkout'
  get 'cart/remove', to: 'carts#remove'
end
