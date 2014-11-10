require 'rails_helper'

feature "Users" do

  scenario "User creates a user" do
    visit users_path
      click_on "Create User"
      fill_in "First name", with: "David"
      fill_in "Last name", with: "Example"
      fill_in "Email address", with: "example@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Create User"
      expect(page).to have_content "David"
      expect(page).to have_content "Example"
      expect(page).to have_content "example@example.com"
  end

  scenario "User edits his username" do
    visit users_path
      click_on "Create User"
      fill_in "First name", with: "David"
      fill_in "Last name", with: "Example"
      fill_in "Email address", with: "example@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Create User"
      expect(page).to have_content "David"
      expect(page).to have_content "Example"
      expect(page).to have_content "example@example.com"
      click_on "Edit"
      fill_in "First name", with: "Stan"
      fill_in "Last name", with: "Lee"
      click_on "Update User"
      expect(page).to have_content "Stan"
      expect(page).to have_content "Lee"
      click_on "Back"
      expect(page).to have_content "Stan"
      expect(page).to have_content "Lee"
      expect(page).to have_content "example@example.com"
  end

  scenario "User deletes a user" do
    visit users_path
      click_on "Create User"
      fill_in "First name", with: "David"
      fill_in "Last name", with: "Example"
      fill_in "Email address", with: "example@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Create User"
      expect(page).to have_content "David"
      expect(page).to have_content "Example"
      expect(page).to have_content "example@example.com"
  end

  scenario "User doesn't fill in first or last name" do
    visit users_path
      click_on "Create User"
      fill_in "Email address", with: "example@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Create User"
      expect(page).to have_content "First name can't be blank"
      expect(page).to have_content "Last name can't be blank"

  end

  #     click_on "Destroy"
  #
  #   expect(page).to have_no_content "Stan"
  #   expect(page).to have_no_content "Lee"
  #   expect(page).to have_no_content "example@example.com"
  #
  # end
end
