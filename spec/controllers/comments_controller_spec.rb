require 'rails_helper'

describe CommentsController do
  describe "Comments" do

    it "redirects visitor to login page if they try to access comments" do
      post :create
      expect(response).to redirect_to(signin_path)
    end

    it "creates a comment for a project member" do
      project = Project.create!(name: "Example")
      user = User.create!(first_name: "David", last_name: "Example", email_address: "david@example.com", password: "password")
      membership = Membership.create!(role: "Member", user: user, project: project)
      task = Task.create!(description: "Test", project: project)

      session[:user_id] = user.id

      post :create,
            project_id: project.id,
            id: task.id,
            comment: {
              :user_id => user.id,
              :task_id => task.id,
              :comment => "waht's up?",
            }

      expect(response).to redirect_to(project_task_path(project, task))
      comment = Comment.last
      expect(comment.comment).to eq("waht's up?")
    end
  end
end
