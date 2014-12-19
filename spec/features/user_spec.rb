  require 'rails_helper'

feature "Users" do

  before do
    User.delete_all
  end

  scenario "User creates a user" do
    pending
    # Unable to autoload constant TrackerAPI
    user1 = create_user
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "password"
    click_on "Enter"
    click_on "Users"
    click_on "Create User"
    fill_in "First name", with: "Stanley"
    fill_in "Last name", with: "Yelnats"
    fill_in "Email address", with: "stan@yel.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create User"
    expect(page).to have_content "Stanley"
  end

  scenario "User edits his username" do
    pending
    # Unable to autoload constant TrackerAPI
    user1 = create_user
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "password"
    click_on "Enter"
    click_on "Test User"
    click_on "Edit"
    fill_in "First name", with: "New"
    click_on "Update User"
    expect(page).to have_content "New"
  end

  scenario "User deletes a user" do #Should this be admin deletes a user and project owner deletes a user?
  visit users_path
  pending
    click_on "Create User"
    fill_in "First", with: "Poe"
    fill_in "Last name", with: "Example"
    fill_in "Email address", with: "mum@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create User"
    expect(page).to have_content "Poe"
    expect(page).to have_content "Example"
    expect(page).to have_content "mum@example.com"
    click_on "Poe"
    click_on "Edit"
    click_on "Delete User"
    expect(page).to have_no_content "Poe"
  end

scenario "Logged in user doesn't fill in first or last name for new user" do
  pending
  # Unable to autoload constant TrackerAPI
  user1 = create_user
  visit root_path
  click_on "Sign In"
  fill_in "Email", with: "test@test.com"
  fill_in "Password", with: "password"
  click_on "Enter"
  click_on "Users"
  click_on "Create User"
  fill_in "Email address", with: "stan@yel.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_on "Create User"
  expect(page).to have_content "First name can't be blank"
  expect(page).to have_content "Last name can't be blank"
  end
end
