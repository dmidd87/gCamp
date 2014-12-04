class RegistrationsController < ApplicationController

  skip_before_action :validates_user_is_present

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(
      :email_address, :first_name, :last_name, :password, :password_confirmation
      ))
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_project_path
    else
      render :new
    end
  end

end
