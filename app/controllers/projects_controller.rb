class ProjectsController < ApplicationController

before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if
      @project.save
      Membership.create!(project_id: @project.id, user_id: current_user.id, role: "owner")
      redirect_to project_tasks_path(@project), notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @project.update(project_params)
    @project.save
    redirect_to project_path, notice: 'Project was successfully updated.'
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully deleted.'
  end

private

  def set_project
    @project = Project.find(params[:id])
  end

def project_params
    params.require(:project).permit(:name)
end

end
