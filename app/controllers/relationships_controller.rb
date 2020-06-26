class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow!(@user)
    flash.now[:success] = 'Followed'
    redirect_to questions_path
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow!(@user)
    flash.now[:info] = 'Unfollowed'
    redirect_to questions_path
  end

end
