require 'rails_helper'

  feature "Sign-up" do

    scenario "User signs up" do
      visit sign_up_path

    fill_in "First name", with: "David"
    fill_in "Last name", with: "Example"
    fill_in "Email address", with: "example@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
      click_on "Register"

    expect(page).to have_content "David"
      click_on "David"

    expect(page).to have_content "David"
    expect(page).to have_content "Example"
    expect(page).to have_content "example@example.com"
      click_on "Edit"

    expect(page).to have_content "First name"
    fill_in "First name", with: "Stan"
      click_on "Update User"

    expect(page).to have_content "Stan"
      click_on "Back"

    expect(page).to have_content "Stan"
    expect(page).to have_content "example@example.com"

  end

end
