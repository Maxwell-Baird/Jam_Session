require 'rails_helper'

RSpec.describe "As a logged in user" do
  it 'should have links' do
    user = User.create(name: "Bob", email: "bob@bob.com", password: "abcd")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/'
    within 'nav' do
      expect(page).to have_link("Home")
      expect(page).to have_link("Dashboard")
      expect(page).to have_link("Stats")
      expect(page).to have_link("About")
    end
  end
end

describe "As a guest user, not logged in" do
  it "I cannot see the Dashboard or Stat's link" do
    visit '/'
    within 'nav' do
      expect(page).to have_link("Home")
      expect(page).to have_link("About")
    end
  end
end
