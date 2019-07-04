require 'rspotify/oauth'

spotify_client_id = ENV["SPOTIFY_CLIENT_ID"]
spotify_client_secret = ENV["SPOTIFY_CLIENT_SECRET"]

RSpotify::authenticate(spotify_client_id, spotify_client_secret)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify,
    spotify_client_id,
    spotify_client_secret,
    scope: 'user-read-email user-library-read user-library-modify ' +
     'playlist-read-collaborative playlist-modify-private playlist-modify-public playlist-read-private'
end
