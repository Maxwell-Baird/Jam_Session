require 'rails_helper'

describe "As a guest user", type: :feature do
  it "I can register as a new user" do
    visit '/register'
    save_and_open_page
    fill_in 'name', with: "New Name"
    fill_in 'email', with: "user@example.com"
    fill_in 'password', with: "password"
    click_on 'Register'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Welcome New Name!')
    expect(User.last.name).to eq("New Name")
    expect(User.last.email).to eq("user@example.com")
  end
end
