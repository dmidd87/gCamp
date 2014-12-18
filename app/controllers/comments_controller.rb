class CommentsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def create
    @comment = @task.comments.new(params.require(:comment).permit(:user_id, :task_id, :comment))
    if current_user != nil
      @comment.user_id = current_user.id
    end
    if @comment.save
      flash[:notice] = "Comment was successfully created."
      redirect_to project_task_path(@project, @task )
    else
      redirect_to project_task_path(@project, @task)
    end
  end

  private

    def comment_params
    params.require(:comment).permit(
    :user_id,
    :task_id,
    :comment,
    )
  end
end
