class SessionsController < ApplicationController

  def new
    render 'new', layout: 'login'
  end

  def create
    if current_user
      redirect_to root_url
    end
    
    user = User.find_by_username(params[:username])
    if user && !user.approved
      flash.now.alert = "You have not yet been approved"
      render "new", layout: 'login'
    elsif user && user.approved? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid username or password"
      render "new", layout: 'login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
