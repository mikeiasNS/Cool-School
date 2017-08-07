class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :authenticate, except: [:login]

  protect_from_forgery with: :exception

  private
  def current_user
    User.find_by(id: session[:user_id])
  end

  def authenticate
    redirect_to login_path unless current_user || request.path == login_path
  end
end
