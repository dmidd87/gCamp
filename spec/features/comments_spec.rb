require 'rails_helper'

feature "Memberships" do

  scenario "Owner of project leaves a comment" do
    pending
    visit signup_path
      fill_in "First name", with: "David"
      fill_in "Last name", with: "Example"
      fill_in "Email address", with: "one@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Register"
      expect(page).to have_content "David"
      fill_in "Name", with: "Foo"
      click_on "Create Project"
      expect(page).to have_content "Foo"
      expect(page).to have_content "David Example"
      click_on "Foo"
      click_on "0 Tasks"
      click_on "Create Task"
      fill_in "Description", with: "Example"
      click_on "Create Task"
      fill_in "comment_comment", with: "Comment text"
      click_on "Create Comment"
    end

    scenario "User tries to add a blank comment to the comments page", :js => true do
        visit root_path
        click_on "Sign Up"
        fill_in "First name", with: "David"
        fill_in "Last name", with: "Example"
        fill_in "Email address", with: "one@example.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_on "Register"
        expect(page).to have_content "David"
        fill_in "Name", with: "Foo"
        click_on "Create Project"
        expect(page).to have_content "Foo"
        click_on "Create Task"
        fill_in "Description", with: "2"
        click_on "Create Task"
        fill_in "comment_comment", with: ""
        click_on "Create Comment"
        expect(page).to have_no_content "less than a minute ago"
      end
end
