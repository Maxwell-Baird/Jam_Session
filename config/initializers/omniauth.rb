Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, 'app_id', 'app_secret', scope: 'playlist-read-private user-read-private user-read-email user-read-currently-playing'
end
