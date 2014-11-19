class MembershipsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end

  def index
    @membership = @project.memberships.new
    @memberships = @project.memberships.all
  end

  def new
    @membership = @project.memberships.new
  end

  def create
    @membership = @project.memberships.new(membership_params)
      if @membership.save
        redirect_to project_memberships_path(@membership,@project),
        notice: "#{@membership.user.full_name} was created successfully"
      else
        @memberships = @project.memberships.all
        render :index
      end
  end

  private 
    def membership_params
      params.require(:membership).permit(:role, :user_id, :project_id)
  end
end
