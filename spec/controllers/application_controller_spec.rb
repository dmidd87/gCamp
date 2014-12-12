require 'rails_helper'

describe ApplicationController do

  describe "permissions" do
    controller do
      def index
        render nothing: true
      end
    end

    it "redirects non-logged in users to signin" do
      get :index
      expect(response).to redirect_to(signin_path)
    end

    it "allows logged-in users to see private layout" do
      user = User.create!(
        first_name: "David",
        last_name: "Example",
        email_address: "d@d.com",
        password: "password")
      session[:user_id] = user.id
      get :index
      expect(response).to be_success
    end
  end
end
