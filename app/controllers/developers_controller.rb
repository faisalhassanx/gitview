class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  
  def index
    @developers = Developer.paginate(page: params[:page], per_page: 5)
  end
  
  def show
   @projects = @developer.projects.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @developer = Developer.new
  end
  
  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      flash[:success] = "Registration is successful"
      session[:developer_id] = @developer.id
      cookies.signed[:developer_id] = @developer.id
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
    if !@developer.admin?
      @developer.destroy
      flash[:danger] = "Account has been deleted"
      if current_user.admin?
        redirect_to developers_path
      else
        session[:developer_id] = nil
        redirect_to root_path
      end
    end
  end
  
  
  private
  
  def set_developer
    @developer = Developer.find(params[:id])
  end
  
  def developer_params
    params.require(:developer).permit(:name, :email, :password, :website, :github)
  end
  
  def require_same_user
    if current_user != @developer and !current_user.admin?
      flash[:danger] = "You can only edit your own profile"
      redirect_to projects_path
    end
  end
  
end