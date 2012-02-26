class FileManagersController < ApplicationController
  # GET /file_managers
  # GET /file_managers.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end
  end
end
