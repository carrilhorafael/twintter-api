class AuthController < ApplicationController
  def login
    @user = User.find_by(email: params[:user][:email])
    if @user.authenticate(params[:user][:password])
      token = JsonWebToken.encode({user_id: @user.id})
      render json: {token: token}
    else
      render json: {error: "Não foi possivel fazer o login"}, status: 401
    end

  end

  def signup
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: @user.errors, status: 422
    end
  end

  def user_params
    params.require(:user).permit(:name, 
      :email, 
      :birthdate, 
      :gender,
      :password,
      :password_confirmation, 
      :contact_phone, 
      :nickname)
  end
end
