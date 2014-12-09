require 'rails_helper'

describe ProjectsController do
  describe "#index" do
    it "redirects visitor to login page if they try to access projects" do
      get :index
      expect(response).to redirect_to(signin_path)
    end

    it "allows existing users to see projects index if they log in" do
      User.delete_all
      user = create_user
      session[:user_id] = user.id
      get :index
      expect(response).to be_success
    end
  end

  describe "#new" do
    it "redirects new logged in users to the projects new page" do
      User.delete_all
      user = create_user
      session[:user_id] = user.id
      get :new
      expect(response).to be_success
    end
  end

  describe "#edit" do
    
  end

  describe "#show" do
    it "shows users projects they are members of" do
      User.delete_all
      user = create_user
      project = create_project
      project2 = create_project2
      membership = create_owner(user, project)
      session[:user_id] = user.id
      get :show, id: project.id
      expect(response).to be_success
    end

    it "does not show users projects they aren't members of" do
      User.delete_all
      user = create_user
      project = create_project
      session[:user_id] = user.id
      get :show, id: project.id
      expect(response.status).to eq(404)
    end

    it "shows admins all projects" do
      admin = create_admin
      project = create_project
      session[:user_id] = admin.id
      get :show, id: project.id
      expect(response).to be_success
    end
  end
end
