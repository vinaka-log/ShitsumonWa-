class UsersController < ApplicationController
  before_action :require_login, only: %i[edit pdate destroy]
  before_action :set_user, only: %i[show edit update destroy]

  def new
    @user = User.new
  end

  def registration
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: 'Please activate & check your email'
    else
      flash.now[:danger] = 'Signup fail'
      render :registration
    end
  end

  def show
    @questions = @user.questions
    @likes_count = 0
    @questions.each do |question|
      @likes_count += question.likes.count
    end
  end

  def index
    @users = User.all
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(5)
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path, success: 'Update success'
    else
      flash.now[:danger] = 'Update failed'
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:info] = 'User delete'
    redirect_to root_path
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, success: 'User was successfully activated ')
    else
      not_authenticated
    end
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(5)
    render 'index'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(5)
    render 'index'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :nationality, :password, :password_confirmation, :image, :twitter, :facebook, :instagram)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
