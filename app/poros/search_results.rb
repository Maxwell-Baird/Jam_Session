class SearchResults
  def initialize()
    @quote_service = QuoteService.new
  end

  def get_quote
    quote_obj = @quote_service.daily_quote
    @quote = Quote.new(quote_obj)
  end
end
