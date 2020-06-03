class Quote
  attr_reader :text, :author
  def initialize(obj)
    @text = obj[:text]
    @author = obj[:author] || "Unknown Author"
  end
end
