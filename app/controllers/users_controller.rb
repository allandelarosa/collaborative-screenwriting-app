class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def new
    if logged_in
      redirect_to scripts_path
    end
  end

  def create
    if !user_params[:email].match /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
      flash[:notice] = "Please enter a valid email address."
      redirect_to '/signup'
    elsif !User.find_by_email(user_params[:email]).nil?
      flash[:notice] = "A user with that email already exists."
      redirect_to '/signup'
    elsif user_params[:password].empty?
      flash[:notice] = "Please enter a password."
      redirect_to '/signup'
    elsif user_params[:password] != user_params[:password_confirmation]
      flash[:notice] = "Password and confirmation do not match."
      redirect_to '/signup'
    else
      user_params[:username] = user_params[:email]
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Account successfully created."
        redirect_to scripts_path
      else
        flash[:notice] = "Account could not be created."
        redirect_to '/signup'
      end
    end
  end
end
