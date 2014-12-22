class ProjectsController < ApplicationController

before_action :set_project, only: [:show, :edit, :update, :destroy]
before_action :current_user_is_owner_to_edit, only: [:edit, :update, :destroy]
before_action :current_user_has_project_permission, except: [:index, :new, :create, :destroy]

  def index
    @projects = current_user.projects
    # tracker_api = TrackerAPI.new
    # @tracker_projects = tracker_api.projects(current_user.pivot_token)
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

  def current_user_has_project_permission
    if (@project.memberships.pluck(:user_id).include? current_user.id) || (current_user.admin == true)
      true
    else
      raise AccessDenied
    end
  end

  def current_user_is_owner_to_edit
    current_membership = @project.memberships.where(user_id: current_user.id)
    current_membership.each do |membership|
      if (membership.role == "owner") || (current_user.admin == true)
        @current_project_owner = true
      else
        @current_project_owner = false
        raise AccessDenied
      end
    end
  end
end
