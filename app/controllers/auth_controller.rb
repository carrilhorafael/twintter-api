class AuthController < ApplicationController
  
  def login
    @user = User.find_by(email: params[:user][:email])
    if @user.authenticate(params[:user][:password])
      token = JsonWebToken.encode({user_id: @user.id})
      render json: {token: token, user: @user}
    else
      render json: {error: "Não foi possivel fazer o login"}, status: 401
    end

  end

  def signup
    @user = User.new(user_params)
    if @user.save
      if @user.generate_validation_token
        render json: @user, status: 201
        UserMailer.with(user: @user).confirm.deliver_now
      end
    else
      render json: @user.errors, status: 422
    end
  end

  def repeat_token
    @user = User.find_by(email: params[:email])
    if @user.present?
      if @user.generate_validation_token
        render json: {status: "OK"}, status: 200
        UserMailer.with(user: @user).repeat_token.deliver_now
      end
    else
      render json: {error: "Usuário não encontrado, faça cadastro!"}
    end
  end

  def confirm
    if params[:validate_token].present?
      @user = User.find_by(validate_token: params[:validate_token])
      if @user.present?
        if @user.validate_user?(params[:validate_token])
          render json: @user
        else
          render json: {error: "Esse token já expirou"}, status: 422
        end
      else
        render json: {error: "usuário não existe"}, status: 404
      end
    else
      render json: {error: "Operação inválida"}, status: 400
    end
  end

  def forgot
    @user = User.find_by(email: params[:email])
    if @user.present?
      if @user.generate_validation_token
        render json: {status: "OK"}, status: 200
        UserMailer.with(user: @user).forgot.deliver_now
      end
    else
      render json:{error: "Usuário não existe"}, status: 404
    end
  end

  def reset_password
    if params[:validate_token].present?
      @user = User.find_by(validate_token: params[:validate_token])
      if @user.present?
        if @user.reset_password_complete?(params[:password], params[:password_confirmation])
          render json: @user
        else
          render json: @user.errors, status: 422
        end
      else
        render json: {error: "Usuário não encontrado"}, status: 404
      end
    else
      render json: {error: "Operação invalida"}, status: 422
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
