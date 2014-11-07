require 'rails_helper'

feature "Projects" do

  scenario "User creates a project" do
    visit projects_path
      click_on "Create Project"

      fill_in "Name", with: "My awesome project!"
        expect(page).to have_no_content "My awesome project!"
      click_on "Create Project"

        expect(page).to have_content "My awesome project!"
      click_on "Edit"

      fill_in "Name", with: "My edited project!"
      click_on "Update Project"

        expect(page).to have_content "My edited project!"
        expect(page).to have_no_content "My awesome project!"

      click_on "Destroy"

        expect(page). to have_no_content "My edited project!"
  end



end
