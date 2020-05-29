Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :study_sessions


  get '/register', to: 'users#new'
  post '/register', to: 'users#create', as: :users

  resources :users, except: [:new, :create]


  root 'welcome#index'

end
