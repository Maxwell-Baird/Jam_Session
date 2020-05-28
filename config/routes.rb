Rails.application.routes.draw do
  root 'welcome#index'
  
  get '/auth/spotify', as: 'spotify_login'
  get '/auth/:provider/callback', to: 'sessions#update'
end
