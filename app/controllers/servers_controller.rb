class ServersController < ApplicationController
  before_filter :ensure_admin

  # GET /servers
  # GET /servers.json
  def index
    @servers = Server.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @servers }
    end
  end

  # GET /servers/1
  # GET /servers/1.json
  def show
    @server = Server.find(params[:id])
    minute_data = Array.new
    five_data = Array.new
    fifteen_data = Array.new
    users_data = Array.new
    
    puts "[LOG] #{users_data}"

    @server.status.status_data.each do |datum|
      minute_data << datum.last_minute_load
      five_data << datum.last_five_load
      fifteen_data << datum.last_fifteen_load
      users_data << datum.user_count
    end
    
    puts "[LOG] #{users_data}"

    @minute_load = minute_data.join(",")
    @five_load = five_data.join(",")
    @fifteen_load = fifteen_data.join(",")
    @users_load = users_data.join(",")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @server }
    end
  end

  # GET /servers/new
  # GET /servers/new.json
  def new
    @server = Server.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @server }
    end
  end

  # GET /servers/1/edit
  def edit
    @server = Server.find(params[:id])
  end

  # POST /servers
  # POST /servers.json
  def create
    @server = Server.new(params[:server])
    @server.create_status(up: false, ports_open: 0, ports: '')

    respond_to do |format|
      if @server.save
        Server.update_statuses
        
        format.html { redirect_to servers_path, notice: 'Server was successfully created.' }
        format.json { render json: @server, status: :created, location: @server }
      else
        format.html { render action: "new" }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /servers/1
  # PUT /servers/1.json
  def update
    @server = Server.find(params[:id])

    respond_to do |format|
      if @server.update_attributes(params[:server])
        format.html { redirect_to servers_path, notice: 'Server was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @server = Server.find(params[:id])
    @server.destroy

    respond_to do |format|
      format.html { redirect_to servers_url }
      format.json { head :ok }
    end
  end

  # GET /servers/status
  def status
    @servers = Server.all
  end

  # GET /servers/forceupdate
  def forceupdate
    Server.update_statuses

    @servers = Server.all

    redirect_to status_servers_path, notice: 'Server statuses updated.'
  end

  private

  def ensure_admin
    unless current_user && current_user.admin
      redirect_to login_path
    end
  end
end
