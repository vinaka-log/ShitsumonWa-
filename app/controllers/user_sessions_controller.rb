class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #マイグレーションファイル作成後、params[:remember]追加  
    if @user = login(params[:email], params[:password], params[:remember])
      redirect_back_or_to(:users, notice: 'login successful')
    else
      flash.now[:alert] = 'login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'logged out!')
  end
end