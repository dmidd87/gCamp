require 'rails_helper'

describe MembershipsController do
  describe "#index" do

    before do
      User.delete_all
    end

    it "redirects visitor to login page if they try to access memberships" do
      project = Project.create!(name: "Example")
      user = User.create!(first_name: "David", last_name: "Example", email_address: "david@example.com", password: "password")
      membership = Membership.create!(role: "Member", user_id: user.id, project_id: project.id)
      get :index, project_id: project.id, membership_id: membership.id
      expect(response).to redirect_to(signin_path)
    end
  end

  describe "#edit" do
    it "Only project owners can manage memberships" do
      pending
    end
  end
end
