class TasksController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @project.tasks
  end

  def new
    @task = @project.tasks.new
  end

  def show
    @comment = @task.comments.new
  end

  def edit
    @task = @project.tasks.find(params[:id])
  end

  def create
    @task = @project.tasks.new(task_params)
      if @task.save
        redirect_to project_task_path(@project,@task), notice: 'Task was successfully created.'
      else
        render :new
      end
  end
  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
      if @task.update(task_params)
        redirect_to project_task_path(@project,@task), notice: 'Task was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @task.destroy
      redirect_to project_tasks_path(@project), notice: 'Task was successfully destroyed.'
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :checkbox, :due, :complete)
    end
end
