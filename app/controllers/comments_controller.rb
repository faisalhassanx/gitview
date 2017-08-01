class CommentsController < ApplicationController
  before_action :require_user
  
  
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params)
    @comment.developer = current_user
    if @comment.save
      ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment )
    else
      flash[:danger] = "Please try again"
      redirect_back fallback_location: root_path
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:description)
  end
  
end