class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account successfully created."
      redirect_to scripts_path
    else
      flash[:notice] = "Invalid username or password"
      redirect_to '/signup'
    end
  end
end
