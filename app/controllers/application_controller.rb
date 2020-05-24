class ApplicationController < ActionController::Base
  before_action :require_login
  
  protect_from_forgery with: :exception
  
  add_flash_types :success, :info, :warning, :danger

  private
  def not_authenticated
    redirect_to login_path, alert: "please login first"
  end
end
