class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  def oauth
    login_at(auth_params[:provider])
   end

  def callback
    provider = auth_params[:provider]
    if (@user = login_from(provider))
      redirect_to user_path(@user.id), info: "#{provider.titleize} Login success"
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to user_path(@user.id), info: "#{provider.titleize} Login success"
      rescue StandardError
        redirect_to root_path, warning: "#{provider.titleize} Login fail"
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end
end
