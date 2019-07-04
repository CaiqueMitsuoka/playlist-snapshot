class Playlist < RSpotify::Playlist
  def self.find(user, uri)
    begin
      super(user, resolve_id(uri))
    rescue RestClient::NotFound
      PlaylistNotFound
    end
  end

  def valid?
    true
  end

  private

  def self.resolve_id(uri)
    uri.match(/playlist[\/:][a-zA-Z0-9]+/).to_s.gsub(/playlist[\/:]/, "")
  end
end

class PlaylistNotFound
  def self.id
    false
  end
end
