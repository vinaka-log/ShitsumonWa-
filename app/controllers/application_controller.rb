class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  
  add_flash_types :success, :info, :warning, :danger


  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  private
  def not_authenticated
    redirect_to login_path, alert: "please login first"
  end
end
