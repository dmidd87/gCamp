require 'rails_helper'

feature "Tasks" do

  scenario "Users can only see tasks under projects that they are members of" do
    pending
  end

  scenario "When a user creates a project, they should be redirected to the tasks index page for that project" do
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
  end

  scenario "User edits a task after making a project" do
    visit projects_path
    pending
      click_on "Create Project"
      fill_in "Name", with: "New"
      click_on "Create Project"
      expect(page).to have_content "New"
      click_on "Tasks"
      click_on "Create Task"
      fill_in "Description", with: "party"
      fill_in "Due", with: "12-12-2014"
      click_on "Create Task"
      expect(page).to have_content "party"
      expect(page).to have_content "2014-12-12"
      click_on "Edit"
      fill_in "Description", with: "shindig"
      click_on "Update Task"
      expect(page).to have_content "shindig"
  end

  scenario "User deletes a task" do
    visit projects_path
    pending
      click_on "Create Project"
      fill_in "Name", with: "New"
      click_on "Create Project"
      expect(page).to have_content "New"
      click_on "Tasks"
      click_on "Create Task"
      fill_in "Description", with: "party"
      fill_in "Due", with: "12-12-2014"
      click_on "Create Task"
      expect(page).to have_content "party"
      expect(page).to have_content "2014-12-12"
      click_on "Tasks"
      find('.glyphicon').click
      expect(page).to have_no_content "party"
  end

  scenario "User leaves out description" do
    visit projects_path
    pending
      click_on "Create Project"
      fill_in "Name", with: "New"
      click_on "Create Project"
      expect(page).to have_content "New"
      click_on "Tasks"
      click_on "Create Task"
      fill_in "Description", with: ""
      click_on "Create Task"
      expect(page).to have_content "Description can't be blank"
  end
end
