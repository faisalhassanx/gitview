class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    developer = Developer.find_by(email: params[:email])
    if developer && developer.authenticate(params[:password])
      session[:developer_id] = developer.id
      cookies.signed[:developer_id] = developer.id
      flash[:success] = "You have logged in successfully"
      redirect_to projects_path
    else
      flash.now[:danger] = "Invalid email or password"
      render 'sessions/new'
    end
  end
  
  def destroy
    session[:developer_id] = nil
    flash[:success] = "You have logged out successfully"
    redirect_to root_path
  end
  
end