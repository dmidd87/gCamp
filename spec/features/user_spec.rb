require 'rails_helper'

feature "Users" do

scenario "User creates a user" do
  visit users_path
  pending
    click_on "Create User"
    fill_in "First name", with: "David"
    fill_in "Last name", with: "Example"
    fill_in "Email address", with: "ab@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create User"
    expect(page).to have_content "David"
    expect(page).to have_content "Example"
    expect(page).to have_content "ab@example.com"
end

scenario "User edits his username" do
  visit users_path
  pending
    click_on "Create User"
    fill_in "First name", with: "Bob"
    fill_in "Last name", with: "Example"
    fill_in "Email address", with: "op@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create User"
    expect(page).to have_content "Bob"
    expect(page).to have_content "Example"
    expect(page).to have_content "op@example.com"
    click_on "Bob"
    click_on "Edit"
    fill_in "First name", with: "Bill"
    fill_in "Last name", with: "Lee"
    click_on "Update User"
    expect(page).to have_content "Bill"
    expect(page).to have_content "Lee"
    expect(page).to have_content "op@example.com"
  end

  scenario "User deletes a user" do
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

scenario "User doesn't fill in first or last name" do
  visit users_path
  pending
    click_on "Create User"
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create User"
    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
  end
end
