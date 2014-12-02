require 'rails_helper'

  feature "Visitors" do

    scenario "Visitor loads homepage" do
      visit root_path
      expect(page).to have_content "Sign In"
    end
end
