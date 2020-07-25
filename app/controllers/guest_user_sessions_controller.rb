class GuestUserSessionsController < ApplicationController
  def create
    @user = User.find_by(email:"test@example.com")
    session[:user_id] = @user.id
    redirect_back_or_to(user_path(@user.id), success: 'Login success as guest user')
  end
end
