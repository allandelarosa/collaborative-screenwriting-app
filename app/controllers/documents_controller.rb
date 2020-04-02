class DocumentsController < ApplicationController
    #respond_to :json

    def create
        #if the document exists, delete it
        # if Document.exists?(params[:script_id])
        #     @doc = Script.find(params[:script_id])
        #     @doc.destroy
        # end
        @doc = Document.find_by(script_id:params[:script_id])
        #print(@doc.id)
       #@parsed_blocks = params[:blocks].delete! '\\'
        @doc.update!(blocks:params[:blocks],time:params[:time],version:params[:version])
        # print("blocks\n")
        # print(:blocks)
        # print("blocks\n")
        # print(:script_id)
        # print("blocks\n")
        # print(:time)
        # print("blocks\n")
        # print(:version)


        # Document.where
    end

    def index
        print(params[:script_id])
        #@doc = Document.find(params[:script_id])
        if Document.exists?(params[:script_id])
            print("this is a exisitng script")
            @doc = Document.find(params[:script_id])
        else
            print("this is an new script")
            @doc = Document.create!(:script_id => params[:script_id], :blocks => "", :time => 1, :version => " ")

        end
      render( :json => @doc)

    end
end
