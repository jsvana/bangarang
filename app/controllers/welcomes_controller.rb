class WelcomesController < ApplicationController
  # GET /welcomes
  # GET /welcomes.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @welcomes }
    end
  end
end
