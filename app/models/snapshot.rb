class Snapshot
  OFFSET_LIMIT = 100

  def initialize(user, playlist)
    @user = user
    @playlist = playlist
  end

  def name
    @name ||= "#{playlist.name} - #{Time.now.strftime("%d/%m/%Y")}"
  end

  def copy!
    create_playlist!

    copy_tracks!

    update_playlist_details!
  end

  private

  attr_accessor :user, :playlist, :new_playlist

  def create_playlist!
    @new_playlist = user.create_playlist!("Copying", public: false)
  end

  def copy_tracks!
    offsets = playlist.total / OFFSET_LIMIT

    (0...offsets).each do |offset|
      tracks = playlist.tracks(limit: OFFSET_LIMIT, offset: offset)

      new_playlist.add_tracks!(tracks)
    end
  end

  def update_playlist_details!
    new_playlist.change_details!(
      name: name,
      description: playlist.description,
      collaborative: false
    )
  end
end
