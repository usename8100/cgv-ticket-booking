Rails.application.routes.draw do
  get 'users/new'
  get 'static_pages/home'

  resources :users
  resources :account_activations, only: [:edit]
  root 'static_pages#home'
end
