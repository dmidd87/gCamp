require 'rails_helper'

describe ProjectsController do
  describe "Projects" do

    it "redirects visitor to login page if they try to access projects" do
      get :index
      expect(response).to redirect_to(signin_path)
    end
  end
end
