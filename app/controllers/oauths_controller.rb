class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false
  
 def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if (@user = login_from(provider))
      redirect_to root_path, notice: "#{provider.titleize}Login successed"
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to root_path, notice: "#{provider.titleize}Login successed"
      rescue StandardError
        redirect_to root_path, alert: "#{provider.titleize}Login failed"
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end
end