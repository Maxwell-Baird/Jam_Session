# frozen_string_literal: true

class Playlist
  attr_reader :url, :name

  def initialize(playlist_data)
    @url = playlist_data[:url].insert(25, 'embed/')
    @name = playlist_data[:name]
  end

  def self.selected_playlist(playlists, selection)
    playlist = playlists.find do |playlist|
      selection == playlist.name
    end
    playlist.url
  end
end
