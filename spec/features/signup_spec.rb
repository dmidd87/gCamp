require 'rails_helper'

  feature "Sign-up" do

  scenario "New user signs up and is redirected to new projects page", :js => true do
    visit signup_path
    fill_in "First name", with: "David"
    fill_in "Last name", with: "Example"
    fill_in "Email address", with: "ten@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Register"
    expect(page).to have_content "New Project"
  end

  scenario "User signs up and clicks the gCamp logo", :js => true do
    visit signup_path
    fill_in "First name", with: "David"
    fill_in "Last name", with: "Example"
    fill_in "Email address", with: "two@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Register"
    expect(page).to have_content "David"
    click_on "gCamp"
    expect(page).to have_content "Create Project"
  end

  scenario "User signs up and clicks the their name and sees the user edit page", :js => true do
    visit signup_path
    fill_in "First name", with: "David"
    fill_in "Last name", with: "Example"
    fill_in "Email address", with: "fifty@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Register"
    expect(page).to have_content "David"
    click_on "David"
    expect(page).to have_content "fifty@example.com"
  end

  scenario "User edits user name" do
    pending
    visit signup_path
    fill_in "First name", with: "David"
    fill_in "Last name", with: "Example"
    fill_in "Email address", with: "two@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Register"
    expect(page).to have_content "David"
    expect(page).to have_content "Example"
    click_on "David Example"
    click_on "Edit"
    fill_in "First name", with: "Stan"
    click_on "Update User"
    expect(page).to have_content "Stan"
  end

  scenario "User signs up, out, and back in" do
    visit signup_path
    fill_in "First name", with: "David"
    fill_in "Last name", with: "Example"
    fill_in "Email address", with: "three@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Register"
    expect(page).to have_content "David"
    click_on "Sign Out"
    expect(page).to have_no_content "example@example.com"
    click_on "Sign In"
    fill_in "Email", with: "three@example.com"
    fill_in "Password", with: "password"
    click_on "Enter"
    expect(page).to have_content "Project"
  end
end
