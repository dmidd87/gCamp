require 'rails_helper'

feature "Memberships" do

  scenario "User adds self as member to new project and
  adds a comment to the comments page" do
    visit signup_path

      fill_in "First name", with: "David"
      fill_in "Last name", with: "Example"
      fill_in "Email address", with: "one@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Register"
      expect(page).to have_content "David"

      click_on "Projects"
      click_on "Create Project"
      fill_in "Name", with: "Foo"
      click_on "Create Project"
      expect(page).to have_content "Foo"
      click_on "0 Members"
      select "David Example", from: "membership_user_id"
      click_on "Add new member"
      expect(page).to have_content "David Example"
      click_on "Foo"
      click_on "0 Tasks"
      click_on "Create Task"
      fill_in "Description", with: "Example"
      click_on "Create Task"
      fill_in "comment_comment", with: "Comment text"
      click_on "Create Comment"
    end

    scenario "User adds self as member to new project and
    tries to add a blank comment to the comments page" do
      visit signup_path

        fill_in "First name", with: "David"
        fill_in "Last name", with: "Example"
        fill_in "Email address", with: "one@example.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_on "Register"
        expect(page).to have_content "David"

        click_on "Projects"
        click_on "Create Project"
        fill_in "Name", with: "Foo"
        click_on "Create Project"
        expect(page).to have_content "Foo"
        click_on "0 Members"
        select "David Example", from: "membership_user_id"
        click_on "Add new member"
        expect(page).to have_content "David Example"
        click_on "Foo"
        click_on "0 Tasks"
        click_on "Create Task"
        fill_in "Description", with: ""
        click_on "Create Task"
        expect(page).to have_content "Description can't be blank"
      end
end
