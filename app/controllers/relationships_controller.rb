class RelationshipsController < ApplicationController
  before_action :require_login

  def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_url) }
      format.js
    end
  end

  def destroy
    @user = User.find(params[:relationship][:following_id])
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_url) }
      format.js
    end
  end
end
