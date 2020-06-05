# frozen_string_literal: true

class SearchResults
  def get_quote
    response = Faraday.get('https://jam-session-ms.herokuapp.com/quote')
    quote_obj = JSON.parse(response.body, symbolize_names: true)
    @quote = Quote.new(quote_obj)
  end

  def get_playlists(token)
    conn = Faraday.new('https://jam-session-ms.herokuapp.com')
    response = conn.get("/playlists/#{token}")
    playlists_data = JSON.parse(response.body, symbolize_names: true)
    @playlists = playlists_data[:items].map do |playlist_params|
      Playlist.new({url: playlist_params[:external_urls][:spotify],
                    name: playlist_params[:name]})
    end
    @playlists
  end
end
