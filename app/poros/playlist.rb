class Playlist
  attr_reader :url, :name, :track_count

  def initialize(playlist_data)
    @url = playlist_data[:url].insert(25, 'embed/')
    @name = playlist_data[:name]
    @track_count = playlist_data[:track_count]
  end

  def self.selected_playlist(playlists, selection)
    playlist = playlists.find do |playlist|
      selection == playlist.name
    end
    if playlist.nil?
      playlist = playlists.find do |playlist|
        selection == "Jamz"
      end
    end
    playlist.url
  end
end
