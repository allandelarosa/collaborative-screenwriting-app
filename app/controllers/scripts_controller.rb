class ScriptsController < ApplicationController
  # requires user to be logged in to view any scripts
  before_action :authorize

  def script_params
    params.require(:script).permit(:title, :author)
  end

  def index
    user_id = session[:user_id]
    @scripts = Script.for_user(user_id)
    #@time = Time.now() - @script.updated_at

    @scripts = @scripts.sort_by { |script| script.getTimeInSecs }

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
    user_id = session[:user_id]
    @script = Script.add_new(script_params,user_id)
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
      @script.update!(last_edited:params[:last_edited],last_edited_full:params[:last_edited_full])
      print(params)
    elsif params.has_key?(:save_script)
      # only update title and author if nonempty strings
      script_title = params[:title].empty? ? @script.title : params[:title]
      script_author = params[:author].empty? ? @script.author : params[:author]
      @script.update!(title:script_title,author:script_author)
    else
      # obsolete, now that the button is removed

      # print(params)
      # print(params[:id])
      # @script.update_attributes!(script_params)
      # flash[:notice] = "#{@script.title} was successfully updated."
      # redirect_to script_path(@script)
    end
  end

end
