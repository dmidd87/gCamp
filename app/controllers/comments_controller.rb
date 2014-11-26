class CommentsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def create
    @comment = @task.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to project_task_path(@project,@task)
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
