class TypesController < ApplicationController
  before_action :set_type, only: [:show]
  before_action :require_admin, only: [:new, :create]
  
  def index
  end
  
  def show
    @type = Type.find(params[:id])
    @projects = @type.projects.paginate(page: params[:page], per_page: 6)
  end
  
  def new
    @type = Type.new
  end
  
  def create
    @type = Type.new(type_params)
    if @type.save
      flash[:success] = "Type has been saved successfully"
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
  
  def set_type
    @type = Type.find(params[:id])
  end
  
  def type_params
    params.require(:type).permit(:name)
  end
  
  def require_admin
    if logged_in? && !current_user.admin?
      flash[:danger] = "Admin privileges required"
      redirect_to root_path
    end
  end
  
end