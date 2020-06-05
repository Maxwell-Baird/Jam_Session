# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['SPOTIFY_CLIENT_ID_1'], ENV['SPOTIFY_SECRET_1'],
  scope: 'streaming playlist-read-collaborative playlist-read-private user-read-private'
end
