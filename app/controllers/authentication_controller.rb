class AuthenticationController < ActionController::Base

   def destroy
    session.clear
    redirect_to root_path
  end

  def new
    
  end

end
