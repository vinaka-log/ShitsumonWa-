# frozen_string_literal: true

class PasswordResetsController < ApplicationController
  skip_before_action :require_login, raise: false

  def create
    @user = User.find_by_email(params[:email])

    if @user
      @user.deliver_reset_password_instructions!
      redirect_to(root_path, info: 'Instructions have been sent to your email')
    else
      flash.now[:danger] = 'Email address is wrong'
      render template: 'pages/index'
    end
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      nil
    end
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password!(params[:user][:password])
      redirect_to(root_path, info: 'Password is successfully update')
    else
      flash.now[:danger] = 'The confirmation password and the password entered do not match'
      render :edit
    end
  end
end
