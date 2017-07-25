class TechnologiesController < ApplicationController
  before_action :set_technology, only: [:show]
  before_action :require_admin, only: [:new, :create]
  
  def index
  end
  
  def show
    @projects = @technology.projects.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @technology = Technology.new
  end
  
  def create
    @technology = Technology.new(technology_params)
    if @technology.save
      flash[:success] = "Technology has been saved successfully"
      redirect_to projects_path
    else
      flash[:danger] = "Please try again"
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  
  private
  
  def set_technology
    @technology = Technology.find(params[:id])
  end
  
  def technology_params
    params.require(:technology).permit(:name)
  end
  
  def require_admin
    if !logged_in? || (logged_in? and !current_user.admin?)
      if !logged_in?
        flash[:danger] = "Please log in or sign up"
        redirect_to login_path
      else
        flash[:danger] = "Admin privileges required"
        redirect_to root_path
      end
    end
  end
  
end