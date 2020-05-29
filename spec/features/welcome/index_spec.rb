require "rails_helper"

RSpec.describe 'As a visitor to Home Page' do
  it 'should have quick information about app' do
    visit '/'
    expect(page).to have_content('Welcome to Jam Session.')
    expect(page).to have_content('This app provides you the ability to time block your study session while also being able to listen to music from Spotify.')
    expect(page).to have_content("Please Register or Log In.")
    expect(page).to have_button("Register")
    expect(page).to have_button("Login")
  end
end
