require 'rails_helper'

feature "Memberships" do

  before do
    User.delete_all
  end

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
    pending
    create_user = User.new
    visit new_project_path
    fill_in "input", with: "Foo"
    click_on "Create Project"
      expect(page).to have_content "Foo"
      fill_in "Description", with: "Thing"
      click_on "Create Task"
      select "David Example", from: "membership_user_id"
      click_on "Add new member"
      expect(page).to have_content "David Example"
    end

  scenario "Project owner can manage memberships" do
    visit root_path
    user2 = create_user2
    click_on "Sign Up"
    fill_in "First name", with: "David"
    fill_in "Last name", with: "Example"
    fill_in "Email address", with: "ab@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Register"
    fill_in "Name", with: "test project"
    click_on "Create Project"
    within('ol.breadcrumb') do
      click_on "test project"
    end
    click_on "1 Member"
    within('div.row') do
      expect(page).to have_content "owner"
    end
    select "Test2", from: "membership_user_id"
    click_on "Add New Member"
    find('.glyphicon').click
    expect(page).to have_content "Test2 User was removed successfully"
  end

  scenario "Admin user can manage memberships" do
    pending
  end

  scenario "Non project owners can view memberships but not click on user and see the user edit page" do
    pending
  end

  scenario "Non project owners can view memberships but not see create user form" do
    pending
  end

  scenario "Users can remove themselves from projects" do
    pending
  end
end
