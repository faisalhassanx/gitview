class TechnologiesController < ApplicationController
  
  def index
  end
  
  def show
    @technology = Technology.find(params[:id])
    @projects = @technology.recipes.paginate(page: params[:page], per_page: 5)
  end
  end
  
  def new
    
  end
  
  def create
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  
  private
  
  
end