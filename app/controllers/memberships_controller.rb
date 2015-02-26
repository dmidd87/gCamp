class MembershipsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end

  def index
    @membership = Membership.new
    @memberships = @project.memberships
  end

  def new
    @membership = @project.memberships.new
  end

  def create
    @membership = @project.memberships.new(membership_params)
      if @membership.save
        redirect_to project_memberships_path(@project),
        notice: "#{@membership.user.full_name}
         was added to this project successfully"
      else
        render :index
      end
  end

  def update
    membership = Membership.find(params[:id])
    membership.update(membership_params)
    if membership.save
      redirect_to project_memberships_path, notice: "#{membership.user.full_name} was updated successfully."
    else
      render :index
    end
  end

  def destroy
    membership = Membership.find(params[:id])
    membership.destroy
    redirect_to project_memberships_path, notice: " #{membership.user.full_name} was removed successfully."
  end

  private
  def membership_params
    params.require(:membership).permit(:role, :user_id, :project_id)
  end
end
