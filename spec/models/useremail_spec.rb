require 'rails_helper'

  describe 'Email_Address' do

    it "validates the presence of a unique email address" do
      email = User.new(email_address: "example@example.com")
      email.valid?
      expect(email.errors[:email_address].present?).to eq(false)
    end

    it "validates that if a unique email address
    is in the db it can't be made" do

      User.create!(
        first_name: "stan",
        last_name: "bob",
        password: "password",
        email_address: "e@example.com"
      )
      user = User.new(
        first_name: "bill",
        last_name: "joe",
        password: "password",
        email_address: "e@example.com"
      )
      user.valid?
      expect(user.errors[:email_address].present?).to eq(true)
    end
  end
