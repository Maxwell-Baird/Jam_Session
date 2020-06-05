# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'logging in' do
  it 'can log in with valid credentials' do
    VCR.use_cassette('quote_cassette') do
      user = User.create(name: 'Pablo Dee',
                         email: 'test@example.com',
                         password: 'password')

      visit '/'

      click_on 'Login'

      expect(current_path).to eq('/login')

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_on 'Log In'

      expect(current_path).to eq('/dashboard')
    end
  end

  it 'cannot log in with a bad password' do
    user = User.create(name: 'Pablo Dee',
                       email: 'test@example.com',
                       password: 'password')

    visit '/'

    click_on 'Login'

    expect(current_path).to eq('/login')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongpassword'

    click_on 'Log In'

    expect(current_path).to eq('/login')
    expect(page).to have_content('Your email or password was incorrect')
  end

  it 'based on spotify' do
    user = User.create(name: 'Pablo Dee',
                       email: 'test@example.com',
                       password: 'password',
                       spotify_token: "token")
    OmniAuth.config.test_mode = true
    Playlist.any_instance.stub(:url).and_return("https://open.spotify.com/embed/playlist/2qo6t4Qxc8F4fmr7cHpV8W")
    Playlist.any_instance.stub(:name).and_return("test")
    Playlist.any_instance.stub(:initialize).and_return('test')
    playlist = Playlist.new("test")
    SearchResults.any_instance.stub(:get_playlists).and_return([playlist])
    OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new({
      provider: 'spotify',
      extra: {
        raw_info: {
          uid: "1234",
          name: "Horace",
          login: "Maxwell-Baird",
        }
      },
      credentials: {
        token: "token",
        secret: "secretpizza"
      }
    })
    visit '/'

    click_on 'Login'

    expect(current_path).to eq('/login')
    click_on "Login With Spotify"
    expect(current_path).to eq('/dashboard')
  end
end
