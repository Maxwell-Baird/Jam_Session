# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a logged in user who is connected with spotify' do
  xit 'I see a dropdown menu with my playlist names on my dashboard' do
    VCR.use_cassette('spotify_cassette') do
      user = User.create(name: 'Pablo Dee',
                         email: 'test@example.com',
                         password: 'password',
                         spotify_token: ENV['SPOTIFY_TEMP_TOKEN'],
                         refresh_token: ENV['SPOTIFY_TEMP_TOKEN'],
                         token_expiration: Time.now + 3600)
      visit '/'

      click_on 'Login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_on 'Log In'

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'
      select 'World of Warcraft calm music', from: 'playlist-select'
      click_on 'Play'

      expect(current_path).to eq('/dashboard')
      within '#spotify-embedded' do
        expect(page).to have_content('World of Warcraft calm music')
        expect(page).to have_content('Elwynn Forest')
      end
    end
  end
end
