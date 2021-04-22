# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#home'
  get '/signup', to: 'users#new'
  resources :users
  resources :groups, only: %i[create new] do
    resources :wishlists, only: %i[create new]
  end
  resources :payments, only: [:index]
  resources :groups
  resource :wishlists do
    resources :payments, only: [:create]
  end
  get 'payments/show', to: "payments#show"
  get 'wishlists/index', to: "wishlists#index"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
