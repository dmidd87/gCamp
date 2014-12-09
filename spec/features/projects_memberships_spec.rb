require 'rails_helper'

feature "Memberships" do

  scenario "User creates a project and is added as an owner automatically" do
    visit root_path
      click_on "Sign Up"
      fill_in "First name", with: "David"
      fill_in "Last name", with: "Example"
      fill_in "Email address", with: "ab@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Register"
      fill_in "Name", with: "test project"
      click_on "Create Project"
      expect(page).to have_content "test project Tasks"
      expect(Membership.last.role).to eq("owner")
  end

  scenario "User who created a project adds a user as a member" do
    visit signup_path
      pending
      fill_in "First name", with: "David"
      fill_in "Last name", with: "Example"
      fill_in "Email address", with: "example@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Register"
      expect(page).to have_content "David"
      fill_in "Name", with: "Foo"
      click_on "Create Project"
      expect(page).to have_content "Foo"
      click_on "Create Task"
      fill_in "Description", with: "Thing"
      click_on "Create Task"
      select "David Example", from: "membership_user_id"
      click_on "Add new member"
      expect(page).to have_content "David Example"
    end
end
