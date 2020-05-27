class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: 'Signup success'
    else
      flash.now[danger] = "Signup failed"
      render :new
    end
  end

   
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    else
      flash.now[danger] = "Update failed"
      render 'edit'
    end
  end

  
  #sorceryで、認証を行う
  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'User was successfully activated.')
    else
      not_authenticated
    end
  end

   private
      def user_params
        params.require(:user).permit(:name, :email, :nationality, :password, :password_confirmation)
      end
end
