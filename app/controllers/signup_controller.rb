class SignupController <ApplicationController

  def index
  end

  def new
  end

  def create
    user = User.find_by_email(params[:email_address].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      @sign_in_error = "Username / password combination is invalid"
      render :new
    end
  end

end
