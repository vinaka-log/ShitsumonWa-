class UserSessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember])
      redirect_back_or_to(user_path(@user.id), success: 'login successful')
    else
      flash.now[:danger] = 'login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'logged out!'
    
  end
  def index
  end

end

