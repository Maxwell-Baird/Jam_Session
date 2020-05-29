require 'rails_helper'

RSpec.describe "As a user" do
  it 'should have links' do
    visit '/'
    within 'nav' do
      expect(page).to have_link("Home")
      expect(page).to have_link("Dashboard")
      expect(page).to have_link("Stats")
      expect(page).to have_link("About")
    end
  end
end
