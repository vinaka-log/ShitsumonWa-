class UserSessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember])
      redirect_back_or_to(user_path(@user.id), success: 'Login success')
    else
      flash.now[:danger] = 'Login fail'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, info: 'Logout!'
  end
end

