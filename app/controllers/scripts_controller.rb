class ScriptsController < ApplicationController
  # requires user to be logged in to view any scripts
  before_action :authorize

  def script_params
    params.require(:script).permit(:title, :author)
  end

  def index
    dummy_email = 'ajd2215' #this will be handled by session[] when user auth is up
    @scripts = Script.for_user(dummy_email)
    #@time = Time.now() - @script.updated_at


  end

  def show
    script_id = params[:id]
    @script = Script.find(script_id)
  end

  def destroy
    @script = Script.find(params[:id])
    @script.destroy
    flash[:notice] = "Script #{@script.title} was  deleted."
    redirect_to scripts_path
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

  def edit
    #this route is cut out of the frontend right now
    @script = Script.find params[:id]
  end

  def update

    @script = Script.find(params[:id])
    if params.has_key?(:from_js)
      print('123123123123123123123123123123123123')
      @script.update!(last_edited:params[:last_edited])
      print(params)
    else
      print(params)
      print(params[:id])
      @script.update_attributes!(script_params)
      flash[:notice] = "#{@script.title} was successfully updated."
      redirect_to script_path(@script)
    end
  end

end
