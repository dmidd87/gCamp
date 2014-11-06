class AuthenticationsController < ApplicationController

  def create
    @user = User.find_by({:email_address => params[:email_address]})
     if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to root_path
     else
      @sign_in_error = "Username / password combination is invalid"
      render :new
    end
  end

  def new
    @user = User.new
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
