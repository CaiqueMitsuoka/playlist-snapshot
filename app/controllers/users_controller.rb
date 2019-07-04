class UsersController < ApplicationController
  def index; end

  def create
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])

    session['spotify_user'] = spotify_user.to_hash

    redirect_to new_snapshot_path
  end
end
