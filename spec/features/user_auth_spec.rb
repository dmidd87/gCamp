require 'rails_helper'

feature "User auth" do

  background do
    @password = "password"
    @user = User.new(
      :first_name => "David",
      :last_name => "Example",
      :email_address => "example@example.com",
      :password => @password,
      :password_confirmation => @password
    )
  end

  scenario "User can sign up" do
    register(@user,@password)
    expect(page).to have_content @user.first_name
  end

  scenario "Users can sign out" do
    register(@user,@password)
    expect(page).to have_content @user.first_name
    click_on "Sign Out"
    expect(page).to have_no_content @user.first_name
  end

end
