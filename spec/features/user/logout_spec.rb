require 'rails_helper'

RSpec.describe 'logging in' do
  it 'can log in with valid credentials' do
      user = User.create( name: 'Pablo Dee',
                          email: 'test@example.com',
                          password: 'password')

      visit '/'

      click_on 'Login'

      expect(current_path).to eq('/login')

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      VCR.use_cassette('quote_cassette') do
        click_on 'Log In'

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        expect(current_path).to eq('/dashboard')

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
        click_link 'Logout'

        expect(current_path).to eq('/')
        expect(page).to have_content('Logout Successful')
    end
  end
end
