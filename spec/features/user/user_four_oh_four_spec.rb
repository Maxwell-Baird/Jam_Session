require 'rails_helper'

describe 'as a visitor when I try to visit study sessions' do
  it 'I see a 404 message' do

    visit '/study_sessions/new'

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
