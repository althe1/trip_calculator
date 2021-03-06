class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # If current user doesn't exists assign it to the sessions user ID
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

  helper_method :current_user

  # Used to allow certian controllers to work with accoutn only

  def authorize
    redirect_to signup_path unless current_user
  end

end
