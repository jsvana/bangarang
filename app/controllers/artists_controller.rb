class ArtistsController < ApplicationController
  # GET /albums
  # GET /albums.json
  def index
    @artists = Artist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artists }
    end
  end
end
