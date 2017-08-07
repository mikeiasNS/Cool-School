class SessionsController < ApplicationController
  layout 'session'
  def new
    redirect_to root_path if current_user
  end

  def create
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    if @user
      reset_session
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = "Credenciais inválidas"
      render :new, status: :unauthorized
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
