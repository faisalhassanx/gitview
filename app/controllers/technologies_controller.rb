class TechnologiesController < ApplicationController
  
  def index
  end
  
  def show
    @technology = Technology.find(params[:id])
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
  
  def technology_params
    params.require(:technology).permit(:name)
  end
  
end