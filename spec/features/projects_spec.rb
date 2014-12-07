require 'rails_helper'

feature "Projects" do

  background do
    @password = "password"
    @user = User.new(
      :first_name => "David",
      :last_name => "Example",
      :email_address => "david@example.com",
      :password => @password,
      :password_confirmation => @password
    )

  end

  scenario "Users can only see projects they are members of on the projects index page" do
    pending
    user1 = User.create(
    :first_name => "David",
    :last_name => "Example",
    :email_address => "david@example.com",
    :password => "password",
    :password_confirmation => "password"
    )
    project1 = Project.create(
    :name => "Test1"
    )
    membership1 = Membership.create(
    :user_id => user1.id,
    :project_id => project1.id,
    :role => "owner"
    )

    user2 = User.create(
    :first_name => "Bob",
    :last_name => "Pants",
    :email_address => "bob@example.com",
    :password => @password,
    :password_confirmation => @password
    )
    project2 = Project.create(
    :name => "Test1"
    )
    membership2 = Membership.create(
    :user_id => user2.id,
    :project_id => project2.id,
    :role => "owner"
    )

    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "david@example.com"
    fill_in "Password", with: "password"
    click_on "Enter"
    expect(page).to have_no_content(project2.name)
  end

  scenario "User creates a project" do
    visit projects_path
    pending
      click_on "Create Project"
      fill_in "Name", with: "My awesome project!"
      click_on "Create Project"
      expect(page).to have_content "My awesome project!"
  end

  scenario "User edits a project" do
    visit projects_path
    pending
      click_on "Create Project"
      fill_in "Name", with: "My awesome project!"
      click_on "Create Project"
      expect(page).to have_content "My awesome project!"
      click_on "Edit"
      fill_in "Name", with: "My edited project!"
      click_on "Update Project"
      expect(page).to have_content "My edited project!"
  end

  scenario "User destroys a project" do
    visit projects_path
    pending
      click_on "Create Project"
      fill_in "Name", with: "My awesome project!"
      click_on "Create Project"
      expect(page).to have_content "My awesome project!"
      click_on "Destroy"
      expect(page). to have_no_content "My edited project!"
  end

  scenario "User tries to make a project without a name" do
    visit projects_path
    pending
    click_on "Create Project"
    click_on "Create Project"
    expect(page). to have_content "Name can't be blank"
  end

  scenario "User creates a project and is automatically listed as owner" do
    pending
      register(@user,@password)
      expect(page).to have_content @user.first_name
      expect(page).to have_content "New Project"
      click_on "Create Project"
      fill_in "Name", with: "Assignment"
      click_on "Create Project"
      click_on "Assignment"
      click_on "1 Member"
      expect(page).to have_content "David Example"
      expect(page).to have_content "Owner"
  end
end
