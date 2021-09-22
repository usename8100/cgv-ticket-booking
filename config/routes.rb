Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'
  get 'static_pages/home'

  match '/404', to: 'static_pages#not_found', via: :all
  match '/500', to: 'static_pages#internal_server_error', via: :all
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/movie_demo', to: 'movies#index'
  get '/booking_ticket/:movie_id', to: 'booking_tickets#show'
  get '/screen/:id', to: 'screens#show'

  resources :movies
  resources :shows
  resources :booking_tickets
  resources :screens
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  root 'static_pages#home'
end
