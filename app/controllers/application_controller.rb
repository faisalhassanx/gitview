class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= Developer.find(session[:developer_id]) if session[:developer_id]
  end
  
  def logged_in?
    !!current_user
  end
end
