class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  def index
    @projects = Project.paginate(page: params[:page], per_page: 5)
  end
  
  def show
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project was posted successfully"
      redirect_to project_path(@project)
    else
      flash[:danger] = "Please try again"
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @project.update(project_params)
      flash[:success] = "Project was updated successfully"
      redirect_to project_path(@project)
    else
      flash[:danger] = "Please try again"
      render 'edit'
    end
  end
  
  def destroy
    @project.destroy
    flash[:success] = "Project was deleted successfully"
    redirect_to projects_path
  end
  
  
  private
  
  def set_project
    @project = Project.find(params[:id])
  end
  
  def project_params
    params.require(:project).permit(:name, :tagline, :description, :link, :github)
  end
  
  
end