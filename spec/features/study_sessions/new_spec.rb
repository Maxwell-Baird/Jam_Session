# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'create a new study session' do
  it 'can fill out the form' do
    VCR.use_cassette('quote_cassette') do
      user = User.create(name: 'Pablo Dee',
                         email: 'test@example.com',
                         password: 'password',
                         spotify_token: "token")
     Playlist.any_instance.stub(:url).and_return("https://open.spotify.com/embed/playlist/2qo6t4Qxc8F4fmr7cHpV8W")
     Playlist.any_instance.stub(:name).and_return("test")
     Playlist.any_instance.stub(:initialize).and_return('test')
     playlist = Playlist.new("test")
     SearchResults.any_instance.stub(:get_playlists).and_return([playlist])
     
      visit '/'

      click_on 'Login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_on 'Log In'

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/study_sessions/new'
      fill_in 'Topic', with: 'Ruby'
      fill_in 'Duration', with: '2'
      check 'Paired'
      click_on 'Create Session'
      session = StudySession.last
      expect(current_path).to eq("/study_sessions/#{session.id}")
      expect(page).to have_content('Topic: Ruby')
      expect(page).to have_content('You are currently paired')
    end
  end

  it 'can fill out the form without checking paired' do
    VCR.use_cassette('quote_cassette') do
      user = User.create(name: 'Pablo Dee',
                         email: 'test@example.com',
                         password: 'password')
      visit '/'
      click_on 'Login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log In'

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/study_sessions/new'
      fill_in 'Topic', with: 'Ruby'
      fill_in 'Duration', with: '2'
      click_on 'Create Session'
      session = StudySession.last
      expect(current_path).to eq("/study_sessions/#{session.id}")
      expect(page).to have_content('Topic: Ruby')
      expect(page).to have_content('You are going solo')
    end
  end

  it 'can error out if incorrectly filled in' do
    VCR.use_cassette('quote_cassette') do
      user = User.create(name: 'Pablo Dee',
                         email: 'test@example.com',
                         password: 'password')
      visit '/'

      click_on 'Login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_on 'Log In'

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/study_sessions/new'
      fill_in 'Topic', with: ''
      fill_in 'Duration', with: '2'
      check 'Paired'
      click_on 'Create Session'
      expect(page).to have_content("Topic can't be blank")
    end
  end
end
