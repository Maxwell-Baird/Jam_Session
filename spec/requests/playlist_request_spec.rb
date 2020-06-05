require 'rails_helper'

RSpec.describe 'As a logged in user who has conencted to spotify' do
  it 'on the dashboard and study session show page' do
    VCR.use_cassette('spotify_cassette') do
      result = SearchResults.new.get_playlists(ENV['SPOTIFY_TOKEN'])
      expect(result).to include(Playlist)
    end
  end
end
