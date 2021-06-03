class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  load_and_authorize_resource
  
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

  def add_photo
    # current_user.image = params[:image]
    # byebug
    if current_user.update!(image: params[:image])
      render json: current_user
    else
      render json: {error: "Não foi possivel modificar a imagem"}, status: 422
    end
    
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

  def follow
    @follow = Follow.new(follow_params)

    if @follow.save
      render json: @follow, status: 201
    else
      render json: @follow.errors, status: 422
    end
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

  def follow_params
    params.require(:follow).permit(
      :followed_id,
      :follower_id
    )
  end
end
