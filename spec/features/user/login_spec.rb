require 'rails_helper'

RSpec.describe 'logging in' do
  it 'can log in with valid credentials' do
    VCR.use_cassette('quote_cassette') do
      user = User.create( name: 'Pablo Dee',
                          email: 'test@example.com',
                          password: 'password')

      visit '/'

      click_on 'Login'

      expect(current_path).to eq('/login')

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_on 'Log In'

      expect(current_path).to eq('/dashboard')
    end
  end

  it 'cannot log in with a bad password' do
    user = User.create( name: 'Pablo Dee',
                        email: 'test@example.com',
                        password: 'password')

    visit '/'

    click_on 'Login'

    expect(current_path).to eq('/login')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongpassword'

    click_on 'Log In'

    expect(current_path).to eq('/login')
    expect(page).to have_content('Your email or password was incorrect')
  end
end
