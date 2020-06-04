class SearchResults
  def get_quote
    response = Faraday.get("https://jam-session-ms.herokuapp.com/quote")
    quote_obj = JSON.parse(response.body, symbolize_names: true)
    @quote = Quote.new(quote_obj)
  end
end
