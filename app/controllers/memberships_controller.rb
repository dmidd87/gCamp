Class MembershipsController < ApplicationController

before_action do
  @project = Project.find(params[:project_id])
end

def index
  @memberships = @project.memberships
end


end

before_action do
    @passenger = Passenger.find(params[:passenger_id])
  end
