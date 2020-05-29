require "rails_helper"

RSpec.describe 'create a new study session' do
  it 'can fill out the form' do

    visit '/study_sessions/new'
    fill_in 'Topic', with: 'Ruby'
    fill_in 'Duration', with: '2'
    check "Paired"
    click_on "Create Session"
    session = StudySession.last
    expect(current_path).to eq("/study_sessions/#{session.id}")
    expect(page).to have_content('Topic: Ruby')
    expect(page).to have_content('You are currently paired')
  end

  it 'can fill out the form without checking paired' do

    visit '/study_sessions/new'
    fill_in 'Topic', with: 'Ruby'
    fill_in 'Duration', with: '2'
    click_on "Create Session"
    session = StudySession.last
    expect(current_path).to eq("/study_sessions/#{session.id}")
    expect(page).to have_content('Topic: Ruby')
    expect(page).to have_content('You are going solo')
  end

  it 'can error out if incorrectly filled in' do

    visit '/study_sessions/new'
    fill_in 'Topic', with: ''
    fill_in 'Duration', with: '2'
    check "Paired"
    click_on "Create Session"
    expect(page).to have_content("Topic can't be blank")
  end
end
