# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a visitor to the About Page', type: :feature do
  it 'should show information' do
    description = 'This Application was a 4-person project utilizing Ruby on Rails and Sinatra. It allows the user to set a time blocked session for them to study. Spotify Premium users can opt-in with their Spotify account and listen to music as they study. They can track statistics about their sessions within the Stats section including information like overall time studied and how long they have studied a specific topic.'

    visit '/about'

    expect(page).to have_content('About This App')
    expect(page).to have_content(description)
    expect(page).to have_content('TECH STACK:')
    expect(page).to have_content('Ruby on Rails, Sinatra, Spotify Oauth, Github / Github Project Manager, Travis CI')
  end
end
