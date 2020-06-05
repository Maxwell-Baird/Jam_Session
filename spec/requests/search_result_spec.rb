# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a visitor to the About Page' do
  it 'should show information' do
    VCR.use_cassette('quote_cassette') do
      result = SearchResults.new.get_quote
      expect(result).to be_an_instance_of(Quote)
    end
  end
end
