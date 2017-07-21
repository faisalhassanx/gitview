class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :edit, :update, :destroy]
  
  def index
    @developers = Developer.all
  end
  
  def show
    @projects = @developer.projects.all
  end
  
  def new
    @developer = Developer.new
  end
  
  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      flash[:success] = "Registration is successful"
      session[:developer_id] = @developer.id
      redirect_to projects_path
    else
      flash[:danger] = "Please correct the following errors and try again"
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @developer.update(developer_params)
      flash[:success] = "Account updated successfully"
      redirect_to developer_path(@developer)
    else
      flash[:danger] = "Please correct the following errors and try again"
      render 'edit'
    end
  end
  
  def destroy
    @developer.destroy
    flash[:danger] = "Account has been deleted"
    session[:chef_id] = nil
    redirect_to root_path
  end
  
  
  private
  
  def set_developer
    @developer = Developer.find(params[:id])
  end
  
  def developer_params
    params.require(:developer).permit(:name, :email, :password, :password_confirmation,
                                      :website, :github)
  end
  
end