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
    # Unable to autoload constant TrackerAPI
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
    :name => "Test2"
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

  scenario "User signs up creates a project" do
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
      expect(page).to have_content "test project"
  end

  scenario "User edits a project" do
    pending
    visit root_path
      click_on "Sign Up"
      fill_in "First name", with: "David"
      fill_in "Last name", with: "Example"
      fill_in "Email address", with: "ab@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Register"
      fill_in "Name", with: "foobar"
      click_on "Create Project"
      expect(page).to have_content "foobar"
      click_on "Projects"
      select "foobar", from: "My Project"
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
    visit root_path
      click_on "Sign Up"
      fill_in "First name", with: "David"
      fill_in "Last name", with: "Example"
      fill_in "Email address", with: "ab@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Register"
      fill_in "Name", with: ""
      click_on "Create Project"
      expect(page).to have_content "Name can't be blank"
  end
end
