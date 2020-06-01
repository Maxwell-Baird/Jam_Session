class QuoteService
  def daily_quote
    response = Faraday.get("https://type.fit/api/quotes")
    JSON.parse(response.body, symbolize_names: true).sample
  end
end
