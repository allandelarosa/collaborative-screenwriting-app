class SessionsController < ApplicationController
  
  def session_params
    params.require(:session).permit(:email, :password)
  end

  def new
  end

  def create
    @user = User.find_by_email(session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      # username and password match
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.username} logged in."
      redirect_to scripts_path
    else
      # login failure
      flash[:notice] = "Invalid username or password."
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    # flash[:notice] = "Successfully logged out."
    redirect_to '/login'
  end
end
