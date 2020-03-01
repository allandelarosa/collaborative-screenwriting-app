class ScriptsController < ApplicationController
  def script_params
    params.require(:script).permit(:title, :author)
  end

  def index
    dummy_email = 'ajd2215' #this will be handled by session[] when user auth is up
    @scripts = Script.for_user(dummy_email)

  end

  def show
  script_id = params[:id]
  @script = Script.find(script_id)

  end

  def new
    # renders new template

  end

  def create
    dummy_email = 'ajd2215'
    @script = Script.add_new(script_params,dummy_email)
    flash[:notice] = "#{@script.title} was succesfully created."
    redirect_to scripts_path
  end
end
