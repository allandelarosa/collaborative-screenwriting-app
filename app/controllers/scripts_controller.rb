class ScriptsController < ApplicationController

  def index
    dummy_email = 'ajd2215' #this will be handled by session[] when user auth is up
    @scripts = Script.for_user(dummy_email)

  end
  def show
  @script_id = params[:id]

  end
end
