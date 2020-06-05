# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a logged in user', type: :feature do
  describe 'when I click connect with spotify' do
    before(:each) do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new(
        { 'provider' => 'spotify',
          'uid' => '129075093',
          'credentials' =>
          { 'token' => ENV['SPOTIFY_TEMP_TOKEN'],
            'refresh_token' => ENV['SPOTIFY_TEMP_REFRESH'],
            'expires_at' => 1_590_794_669,
            'expires' => true } }
      )
    end

    it 'My spotify token is saved to my account when I connect to spotify', :vcr do
      user = User.create(name: 'Pablo Dee',
                         email: 'test@example.com',
                         password: 'password')

      visit '/'
      click_on 'Login'

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log In'

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      click_on 'Connect to Spotify'

      expect(user.spotify_token).to eq(ENV['SPOTIFY_TEMP_TOKEN'])
    end
  end
end
