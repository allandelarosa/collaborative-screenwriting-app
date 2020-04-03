class DocumentsController < ApplicationController
    # requires user to be logged in to view any scripts
    before_action :authorize

    def create
        # print("\n\n")
        # print(params[:blocks])
        # print("\n\n")
        # print(params[:time])
        # print("\n\n")
        # print(params[:id])
        print("crearoute")
        print("blocks")
        print(params[:blocks])

    end

    def index
        print("ix")
    end
end
