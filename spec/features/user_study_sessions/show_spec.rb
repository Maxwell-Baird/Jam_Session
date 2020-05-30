require 'rails_helper'

RSpec.describe 'User stats', type: :feature do
  it 'should show information about the user stats' do
    user = User.create(
      name: 'Pablo D',
      email: 'test@example.com',
      password: 'password'
    )
    user.studySessions.create(topic: "Ruby", duration: 5, paired: false)
    user.studySessions.create(topic: "Ruby", duration: 5, paired: true)
    user.studySessions.create(topic: "Cake", duration: 5, paired: true)
    user.studySessions.create(topic: "Cheese", duration: 5, paired: false)
    user.studySessions.create(topic: "Books", duration: 5, paired: false)
    user.studySessions.create(topic: "Books", duration: 5, paired: false)
    visit '/'

    click_on 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Log In'

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/users/#{user.id}/statistics"

    expect(page).to have_content("Total time spent studying:\n30 minutes")
    expect(page).to have_content("Paired time spent studying:\n10 minutes")
    expect(page).to have_content("Web Statistics:\nYou make up 100% of the study time on the website")
    expect(page).to have_content("Ruby\nTime spent studying: 10 minutes\nStudying while paired: 5 minutes")
    expect(page).to have_content("Books\nTime spent studying: 10 minutes\nStudying while paired: 0 minutes")

  end
end
