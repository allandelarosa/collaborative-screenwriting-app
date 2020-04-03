class ApplicationController < ActionController::Base
    # need these macros to make methods available to views
    # before_action :authorized # this runs before any other action is taken
    # helper_method :current_user
    # helper_method :logged_in?

    def create
        print("ddddd")
    end

    # methods for user auth
    # def current_user
    #     User.find_by id: session[:user_id]
    # end

    # def logged_in?
    #     !current_user.nil?
    # end

    # def authorized
    #     redirect_to '/' unless logged_in?
    # end
end
