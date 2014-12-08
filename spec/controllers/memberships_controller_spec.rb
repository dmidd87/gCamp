require 'rails_helper'

describe MembershipsController do
  describe "Memberships" do

    it "redirects visitor to login page if they try to access memberships" do
      project = Project.create!(name: "Example")
      user = User.create!(first_name: "David", last_name: "Example", email_address: "david@example.com", password: "password")
      membership = Membership.create!(role: "Member", user_id: user.id, project_id: project.id)
      get :index, project_id: project.id, membership_id: membership.id
      expect(response).to redirect_to(signin_path)
    end

    it "displays memberships only to users who are members of that project" do
      pending
      user = create_user
      project = create_project
      task = create_task(project)
      membership = create_member(user,project)
      session[:user_id] = user.id
      get :index, project_id: project.id, membership_id: membership.id
      expect(response).to be_success
    end

    it "does not allow non-members of projects to view memberships" do
      pending
      project = create_project
      user = create_user
      session[:user_id] = user.id
      get :index, {project_id: project.id}
      expect(response.status).to eq(404)
    end
  end
end
