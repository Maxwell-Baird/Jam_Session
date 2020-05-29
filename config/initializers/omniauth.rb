Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['SPOTIFY_CLIENT_ID_1'], ENV['SPOTIFY_SECRET_1'],
  scope: 'playlist-read-private user-read-private user-read-email user-read-currently-playing'
end
