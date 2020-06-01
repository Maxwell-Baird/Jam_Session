require 'rails_helper'

RSpec.describe Quote, type: :model do
  it 'should have attributes' do
    quote = Quote.new({text: "This is a quote", author: "Tron"})
    expect(quote.text).to eq("This is a quote")
    expect(quote.author).to eq("Tron")
  end

  it 'should fill in attribute if no author' do
    quote2 = Quote.new({text: "This is also a quote"})
    expect(quote2.text).to eq("This is also a quote")
    expect(quote2.author).to eq("Unknown Author")
  end
end
