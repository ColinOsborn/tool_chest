class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :most_recent_tool, :current_user

  def most_recent_tool
    if Tool.exists?(cookies[:most_recent_tool].to_i)
      Tool.find(cookies[:most_recent_tool]).name
    else
      "No recent tool"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
