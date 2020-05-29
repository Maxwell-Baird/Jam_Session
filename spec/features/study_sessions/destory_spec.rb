require "rails_helper"

RSpec.describe 'destroy a study session' do
  it 'destroy study session' do
    user = User.create(name: "bob", email: "faked", password: "password")
    session1 = user.studySessions.create(topic: "Cheese Making", duration: 4, paired: true)
    visit '/study_sessions/new'
    fill_in 'Topic', with: 'Ruby'
    fill_in 'Duration', with: '2'
    check "Paired"
    click_on "Create Session"
    session2 = StudySession.last
    expect(current_path).to eq("/study_sessions/#{session2.id}")
    expect(page).to have_link('End Session')
    click_on "End Session"
    expect(current_path).to eq("/")
    expect(StudySession.last).to eq(session1)
  end
end
