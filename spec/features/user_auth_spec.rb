require 'rails_helper'

feature "User auth" do

  scenario "User can sign up" do
    visit signup_path
    fill_in "First name", with: "David"
    fill_in "Last name", with: "Example"
    fill_in "Email address", with: "example@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Register"
  end

end
