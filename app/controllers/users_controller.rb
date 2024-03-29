class UsersController < ApplicationController
  before_filter :ensure_logged_in, except: [:new, :create]
  before_filter :ensure_admin, only: [:manage, :set_approved]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /manage
  def manage
    @users = User.all

    respond_to do |format|
      format.html # approved.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html do
          if current_user && current_user.admin
            redirect_to users_path, notice: 'User created.'
          else
            redirect_to root_path, notice: "An email has been sent to the administrator for review and addition."
          end
        end
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_approved
    @user = User.find(params[:id])
    @user.approved = true
    puts 'saving...'
    if @user.save
      puts 'success'
    else
      puts 'failure'
    end
    puts 'saved?'

    respond_to do |format|
      format.js
    end

    # Call program
    #if system('/users/jsvana/bang add', @user.username, @user.password)
    #  puts 'Added'
    #else
    #  puts 'failure'
    #end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end

  private

  def ensure_logged_in
    unless current_user
      redirect_to login_path
    end
  end

  def ensure_admin
    unless current_user && current_user.admin
      redirect_to login_path
    end
  end
end
