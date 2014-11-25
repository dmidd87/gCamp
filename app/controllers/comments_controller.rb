class CommentsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:task_id])
  end

  def create
    @comment = @task.comments.new(comment_params)
  end

  private
    def comment_params
    params.require(:comment).permit(
    :user_id,
    :task_id,
    :comment,
    :created_at,
    :updated_at)
  end
end
