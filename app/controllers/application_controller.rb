class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?, :require_user
  
  
  def current_user
    @current_user ||= Developer.find(session[:developer_id]) if session[:developer_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "Please log in or sign up"
      redirect_to login_path
    end
  end
end
