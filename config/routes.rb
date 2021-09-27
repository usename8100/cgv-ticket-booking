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

  get '/movies/:movie_id/shows', to: 'shows#index', as: 'shows'

  get '/shows/:show_id/screens/:id', to: 'screens#show', as: 'screens'

  get '/shows/:show_id/screens/:screen_id/booking_tickets/new', to: 'booking_tickets#new', as: 'booking_tickets'
  post '/shows/:show_id/screens/:id/booking_tickets/new', to: 'booking_tickets#create'
  get '/tickets', to: 'booking_tickets#index'
  get '/booking_tickets/:id', to: 'booking_tickets#show', as:'show_ticket'
  get '/booking_tickets/:id/send_ticket', to: 'booking_tickets#send_ticket', as: 'send_ticket'

  resources :movies do 
    resources :shows do 
      resources :booking_tickets do 
        collection do
          post :send_ticket
        end
      end
      resources :screens
    end
  end
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  root 'movies#index'
end
