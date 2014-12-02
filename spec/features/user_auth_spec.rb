require 'rails_helper'

feature "User auth" do

  background do
    @password = "password"
    @user = User.new(
      :first_name => "David",
      :last_name => "Example",
      :email_address => "david@example.com",
      :password => @password,
      :password_confirmation => @password
    )
  end

  scenario "Existing user signs up, out, and in and is
  redirected to projects index" do
    register(@user,@password)
    expect(page).to have_content @user.first_name
    click_on "Sign Out"
    click_on "Sign In"
    fill_in "Email", with: "david@example.com"
    fill_in "Password", with: "password"
    click_on "Enter"
    expect(page).to have_content "Create Project"
  end

  scenario "User creates a project and is automatically listed as owner" do
    register(@user,@password)
    expect(page).to have_content @user.first_name
    click_on "Sign Out"
    click_on "Sign In"
    fill_in "Email", with: "david@example.com"
    fill_in "Password", with: "password"
    click_on "Enter"
    expect(page).to have_content "Create Project"
    click_on "Create Project"
    fill_in "Name", with: "Assignment"
    click_on "Create Project"
    click_on "1 Member"
    expect(page).to have_content "David Example"
    expect(page).to have_content "Owner"
  end

  scenario "User can sign up" do
    register(@user,@password)
    expect(page).to have_content @user.first_name
  end

  scenario "Users can sign out" do
    register(@user,@password)
    expect(page).to have_content @user.first_name
    click_on "Sign Out"
    expect(page).to have_no_content @user.first_name
  end

  scenario "User cannot sign up without password" do
    visit signup_path
    fill_in "First name", with: @user.first_name
    fill_in "Last name", with: @user.last_name
    fill_in "Email address", with: @user.email_address
    click_on "Register"
    expect(page).to have_content "Password can't be blank"
  end

  scenario "User cannot sign up without password" do
    register(@user,@password)
    click_on "Sign Out"
    click_on "Sign Up"
    register(@user,@password)
    expect(page).to have_content "Email address has already been taken"
  end





end
