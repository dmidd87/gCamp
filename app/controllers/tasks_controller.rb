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
    @task = @project.tasks.find(params[:id])
  end

  # GET /tasks/1/edit
  def edit
    @task = @project.tasks.find(params[:id])
  end
  # might need to change this later for nested resources

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @project.tasks.new(task_params)
      if @task.save
        redirect_to @task, notice: 'Task was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
      if @task.update(task_params)
        redirect_to project_task_path(@project,@task) notice: 'Task was successfully updated.'
      else
        render :edit
      end
  end
  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
      redirect_to project_tasks_path(@project)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :checkbox, :due, :complete)
    end

end
