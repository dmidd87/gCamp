class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :only_admin_or_self_can_change, only: [:edit, :update, :destroy]

  def index
    @users = User.all
    if current_user.admin != true
      raise AccessDenied
    end
  end

  def show
  end

  def update
    @user.update(user_params)
    @user.save
    redirect_to users_path, notice: 'User was successfully updated.'
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if
      @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def only_admin_or_self_can_change
    unless @user.id == current_user.id || current_user.admin == true
      raise AccessDenied
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email_address, :password, :password_confirmation, :pivot_token)
  end
end
