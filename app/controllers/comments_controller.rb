class CommentsController < ApplicationController
  before_action :require_user
  
  
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params)
    @comment.developer = current_user
    if @comment.save
      flash[:success] = "Comment has been successfully created."
      redirect_to project_path(@project)
    else
      flash[:danger] = "Please try again"
      redirect_to :back
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:description)
  end
  
end