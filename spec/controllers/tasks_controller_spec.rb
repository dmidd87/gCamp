require 'rails_helper'

describe TasksController do
  describe "index" do
    it "redirects visitors to login" do
      project = create_project
      get :index, project_id: project.id
      expect(response).to redirect_to(signin_path)
    end

    it "displays tasks to users who are members" do
      user = create_user
      project = create_project
      task = create_task(project)
      membership = create_member(user,project)
      session[:user_id] = user.id
      get :index, project_id: project.id
      expect(response).to be_success
    end
  end
end
