require 'rails_helper'

describe "As a logged in user visiting my dashboard" do
  before(:each) do
    @user = User.create(name: "Bob", email: "bob@bob.com", password: "abcd")
    visit '/'
    click_on 'Login'
    expect(current_path).to eq('/login')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log In'
    visit dashboard_path
  end

  it "I can click a link that takes me to a new study session" do
    click_on 'New Study Session'

    fill_in :topic, with: 'Study Up'
    fill_in :duration, with: '45'
    click_on 'Create Session'

    study_session = @user.study_sessions.last
    expect(current_path).to eql("/study_sessions/#{study_session.id}")
  end

  it "I can see a list of previous sessions if I have any" do
    session_1 = @user.study_sessions.create(topic: 'Math', paired: false, duration: 45)
    session_2 = @user.study_sessions.create(topic: 'Ruby', paired: false, duration: 30)
    session_3 = @user.study_sessions.create(topic: 'OOP', paired: false, duration: 35)
    visit dashboard_path

    expect(page).to have_content('Previous Sessions')
    expect(page).to have_content(session_1.topic)
    expect(page).to have_content(session_2.topic)
    expect(page).to have_content(session_3.topic)
  end
end
