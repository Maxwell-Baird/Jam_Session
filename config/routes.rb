Rails.application.routes.draw do
  get '/auth/spotify', as: 'spotify_login'
  get '/auth/:provider/callback', to: 'sessions#update'
end
