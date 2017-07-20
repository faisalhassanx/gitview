class DevelopersController < ApplicationController
  
  def index
    @developers = Developer.all
  end
  
  def show
    @developer = Developer.find(params[:id])
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
  
  
  
  
  
  private
  
  def developer_params
    params.require(:developer).permit(:name, :email, :password, :password_confirmation,
                                      :website, :github)
  end
  
end