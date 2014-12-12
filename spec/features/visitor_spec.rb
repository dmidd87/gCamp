require 'rails_helper'

feature "Visitors" do
  scenario "Non logged in users cannot access project, tasks, memberships, and users" do
    project = Project.create!(
      :name => "Awesome project"
    )

    visit projects_path
      expect(page).to have_content('You must be logged in to access that information')
    visit project_tasks_path(project)
      expect(page).to have_content('You must be logged in to access that information')
    visit project_memberships_path(project)
      expect(page).to have_content('You must be logged in to access that information')
    visit users_path(project)
      expect(page).to have_content('You must be logged in to access that information')
    end
end
