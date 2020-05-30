Rails.application.routes.draw do

  root 'welcome#index'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create', as: :users

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  get '/auth/spotify', as: 'spotify_login'
  get '/auth/:provider/callback', to: 'sessions#update'

  resources :users, except: [:new, :create]

  get '/dashboard', to: 'dashboard#index'
  get '/about', to: 'about#index'
end
