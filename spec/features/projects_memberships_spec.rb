require 'rails_helper'

feature "Memberships" do

  scenario "User adds a user to a membership" do
    visit users_path
      click_on "Create User"
      fill_in "First name", with: "David"
      fill_in "Last name", with: "Example"
      fill_in "Email address", with: "example@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Create User"
      expect(page).to have_content "David"
      expect(page).to have_content "Example"
      expect(page).to have_content "example@gmail.com"
      click_on "Projects"
      click_on "Create Project"
      fill_in "Name", with: "Foo"
      click_on "Create Project"
      expect(page).to have_content "Foo"
      click_on "Memberships"
      select "Foo", from: "membership_user_id"
      click_on "Add New Member"
        
    end

end
