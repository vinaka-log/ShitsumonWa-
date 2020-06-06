class UsersController < ApplicationController
  before_action :require_login, only: [:updaate, :destroy]
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
  # <修正する必要あり>
  def show  
    @user = User.find(params[:id])
    @questions = @user.questions.page(params[:page]).per(5).order('updated_at DESC')
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
      redirect_to user_path, success: "Update success"
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

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

   private
      def user_params
        params.require(:user).permit(:name, :email, :nationality, :password, :password_confirmation, :image, :twitter, :facebook, :instagram)
      end
end
