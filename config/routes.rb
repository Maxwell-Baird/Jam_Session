Rails.application.routes.draw do

  root 'welcome#index'
  # post 'dashboard/test', to: 'users#testing'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create', as: :users
  get '/stats', to: 'user_study_sessions#show'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  patch '/study_sessions/:id/', to: 'study_sessions#update'
  resources :study_sessions, except: [:edit, :update]


  get '/auth/spotify', as: 'spotify_login'
  get '/auth/:provider/callback', to: 'sessions#update'

  resources :users, except: [:new, :create]

  get '/dashboard', to: 'users#show'
  post '/dashboard', to: 'users#test'
  get '/about', to: 'about#index'
end
