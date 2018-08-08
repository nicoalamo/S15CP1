class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  def create
    u = User.find_by(email: params[:user][:email])

    if u.present?
      if u.password == params[:user][:password]
        session[:user_id] = u.id
        redirect_to root_path
      else
        redirect_to users_sign_in_path, alert: "Contraseña incorrecta"
      end
    else
        redirect_to users_sign_in_path, alert: "Usuario No Existe"
    end
  end

end
