class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: @user.errors, status: 422
    end
  end

  def index
    @users = User.all

    render json: @users
  end

  def show
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: 422
    end
  end

  def destroy
    @user.destroy
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, 
      :email, 
      :birthdate, 
      :gender, 
      :contact_phone, 
      :nickname)
  end
end
