require 'rails_helper'

describe TasksController do
  describe "Tasks" do

    it "redirects visitor to login page if they try to access tasks" do
      get :tasks
      expect(response).to redirect_to(signin_path)
    end
  end
end
