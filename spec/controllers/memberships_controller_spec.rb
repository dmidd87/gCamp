require 'rails_helper'

describe MembershipsController do
  describe "Memberships" do

    it "redirects visitor to login page if they try to access memberships" do
      get :memberships
      expect(response).to redirect_to(signin_path)
    end
  end
end
