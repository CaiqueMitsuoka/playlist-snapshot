class SnapshotsController < ApplicationController
  def new
  end

  def create
    playlist = Playlist.find(user, params.require(:uri))

    if playlist.id
      Snapshot.new(user, playlist).copy!

      flash[:success] = 'Your Playlist was copied!'
    else
      flash[:error] = 'We wasn\'t able to find your playlist :( make sure do follow the steps above'
    end

    redirect_to action: :new
  end
end
