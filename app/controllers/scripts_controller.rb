class ScriptsController < ApplicationController

  def index

  end
  def show
  @script_id = params[:id]
  end
end
