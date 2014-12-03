require 'rails_helper'

describe UsersController do
  describe "Users" do

    it "redirects visitor to login page if they try to access users" do
      get :users
      expect(response).to redirect_to(signin_path)
    end
  end
end
