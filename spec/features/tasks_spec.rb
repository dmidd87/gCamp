require 'rails_helper'

feature "Tasks" do

  scenario "User creates a task" do
    visit tasks_path
      click_on "Create Task"

      fill_in "Description", with: "My awesome task!"
        expect(page).to have_no_content "My awesome task!"
      click_on "Create Task"
      
        expect(page).to have_content "My awesome task!"

      click_on "Edit"

      fill_in "Description", with: "My edited task!"
      click_on "Update Task"

        expect(page).to have_content "My edited task!"
      click_on "Back"

        expect(page).to have_content "My edited task!"
      click_on "Destroy"

        expect(page).to have_no_content "My edited task!"


 end

end
