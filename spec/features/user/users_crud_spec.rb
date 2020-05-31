require 'rails_helper'

describe "As a guest user" do
  it "I can register as a new user and see my info on my users show page" do
    visit '/register'

    fill_in 'Name', with: "New Name"
    fill_in 'Email', with: "user@example.com"
    fill_in 'Password', with: "password"
    click_on 'Register'

    @user = User.last
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Welcome New Name')
    expect(@user.name).to eq("New Name")
    expect(@user.email).to eq("user@example.com")
  end

  it "I see a flash message if I incorrectly fill out the form, and redirect to the register form" do
    visit '/register'

    fill_in 'Name', with: "New Name"
    fill_in 'Email', with: "user@example.com"
    click_on 'Register'

    expect(current_path).to eq('/register')
    expect(page).to have_content("Password can't be blank")

    fill_in 'Name', with: "New Name"
    fill_in 'Password', with: "password"
    click_on 'Register'

    expect(current_path).to eq('/register')
    expect(page).to have_content("Email can't be blank")

    fill_in 'Email', with: "user@example.com"
    fill_in 'Password', with: "password"
    click_on 'Register'

    expect(current_path).to eq('/register')
    expect(page).to have_content("Name can't be blank")
  end
end


describe "As a registered user when I am logged in" do
  it "I can edit my profile information (No password update)" do
    @user = User.create(name: "Bob", email: "bob@bob.com", password: "abcd")

    visit user_path(@user)

    click_on 'Edit Profile'

    fill_in 'user[email]', with: "bob@example.com"
    click_on 'Update'

    expect(current_path).to eql(user_path(@user))

    expect(page).to have_content("Welcome #{@user.name}")
    expect(page).to have_content("E-Mail: bob@example.com")
  end

  it "I can leave field blank on my update form, which will revert to its original value once I submit it" do
    @user = User.create(name: "Bob", email: "bob@bob.com", password: "abcd")

    visit user_path(@user)

    click_on 'Edit Profile'

    fill_in 'user[name]', with: ""
    fill_in 'user[email]', with: ""
    click_on 'Update'

    expect(current_path).to eql(user_path(@user))

    expect(page).to have_content("Welcome #{@user.name}")
    expect(page).to have_content("E-Mail: bob@bob.com")
  end

  it "I can delete my own user account, and redirect to the register page" do
    @user = User.create(name: "Bob", email: "bob@bob.com", password: "abcd")
    @user2 = User.create(name: "Bobby", email: "bobby@bob.com", password: "abcd")

    visit user_path(@user)

    click_on 'Delete Profile'

    expect(current_path).to eql(register_path)
    expect(User.last.id).to_not eql(@user.id)
  end
end
