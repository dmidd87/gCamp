require 'rails_helper'

describe TasksController do
  describe "#index" do
    it "redirects visitor to login page if they try to access tasks" do
      project = Project.create!(name: "Acme")
      get :index, project_id: project.id
      expect(response).to redirect_to(signin_path)
    end
  end
end
