require 'rails_helper'

RSpec.describe Playlist, type: :model do
  describe 'initialization'
  it 'initializes with name & url. The url inserts /embed at index 25' do
    playlist = Playlist.new({ name: 'Playlist of cool songs',
                              url: 'https://open.spotify.com/playlist/2qo6t4Qxc8F4fmr7cHpV8W'})

    expect(playlist.name).to eq('Playlist of cool songs')
    expect(playlist.url).to eq('https://open.spotify.com/embed/playlist/2qo6t4Qxc8F4fmr7cHpV8W')
  end

  describe 'class methods' do
    it '.selected_playlist' do
      playlist_1 = Playlist.new({name: 'Playlist of cool songs',
                              url: 'https://open.spotify.com/playlist/2qo6ioj3Qx84fmrSlpV8W'})
      playlist_2 = Playlist.new({name: 'Playlist of dope songs',
                              url: 'https://open.spotify.com/playlist/324ij2oijk2mlkm423lkm'})
      playlist_3 = Playlist.new({name: 'World of Warcraft calm music',
                              url: 'https://open.spotify.com/playlist/2qo6t4Qxc8F4fmr7cHpV8W'})
      playlist_4 = Playlist.new({name: 'Playlist of okay songs',
                              url: 'https://open.spotify.com/playlist/2qo6t4Qeqw348F4fmr7cV8W'})

      playlists = [playlist_1, playlist_2, playlist_3, playlist_4]

      selection = 'World of Warcraft calm music'

      expect(playlists.length).to eq(4)
      expect(Playlist.selected_playlist(playlists, selection)).to eq('https://open.spotify.com/embed/playlist/2qo6t4Qxc8F4fmr7cHpV8W')
    end
  end
end
