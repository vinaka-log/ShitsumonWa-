class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@uer)
    if following.save
       flash[:success] = 'follow success!!'
       redirect_to @user
    else 
      flash.now[:alert] = 'follow failed!!'
      redirect_to @user
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'unfollow success!!'
      redirect_to @user
    else
      flash.now[:alert] = 'unfollow failed'
      redirect_to @user
    end
  end

    private
    def
      @user = User.find(params[:relationship][:follow_id])
    end

end
