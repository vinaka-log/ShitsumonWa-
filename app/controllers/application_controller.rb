class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

    private

    def not_authenticated
      redirect_to login_path, alert: "please login first"
    end

    def require_login
      unless current_user
        redirect_to login_url
      end
    end
end
