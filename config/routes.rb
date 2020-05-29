Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/register', to: 'users#new'
  post '/register', to: 'users#create', as: :users
  get '/users/:id/statistics', to: 'user_study_sessions#show'

  resources :users, except: [:new, :create]

  resources :study_sessions

  root 'welcome#index'

end
