require 'rails_helper'

describe TasksController do
  describe "index" do
    it "redirects visitors to login" do
      project = create_project
      get :index, project_id: project.id
      expect(response).to redirect_to(signin_path)
    end

    it "displays tasks to users who are members" do
      User.delete_all
      user = create_user
      project = create_project
      task = create_task(project)
      membership = create_member(user,project)
      session[:user_id] = user.id
      get :index, project_id: project.id
      expect(response).to be_success
    end

    it "displays tasks to owners who are members" do
      User.delete_all
      user = create_user
      project = create_project
      task = create_task(project)
      membership = create_owner(user,project)
      session[:user_id] = user.id
      get :index, project_id: project.id
      expect(response).to be_success
    end

    it "doesn't displays tasks to users who aren't members or owners" do
      User.delete_all
      user = create_user
      project = create_project
      task = create_task(project)
      membership = create_member(user, project)
      session[:user_id] = user.id
      get :index, project_id: project.id
      expect(response.status).to eq(200)
      user2 = create_user2
      session[:user_id] = user2.id
      get :index, project_id: project.id
      expect(response.status).to eq(404)
    end

    it "redirects to tasks index after a user creates a project" do
      User.delete_all
      user = create_user
      project = create_project
      get :index, project_id: project.id
      expect(response.status).to eq(302)
    end
  end
end
