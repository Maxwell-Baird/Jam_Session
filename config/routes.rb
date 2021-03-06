# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  # post 'dashboard/test', to: 'users#testing'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create', as: :users
  get '/stats', to: 'user_study_sessions#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :study_sessions

  get '/auth/spotify', as: 'spotify_login'
  get '/auth/:provider/callback', to: 'sessions#update'

  resources :users, except: %i[new create]

  get '/dashboard', to: 'users#show'
  get '/about', to: 'about#index'
end
