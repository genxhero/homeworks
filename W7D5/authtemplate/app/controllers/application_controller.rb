class ApplicationController < ActionController::Base
  helper_method :login, :logout, :current_user, :require_login, :logged_in?

  def login(user)
    session[:session_token] = user.reset_token
  end

  def logout
    current_user.reset_token
    session[:session_token] = nil
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_login
    redirect_to new_session_url unless logged_in?
    #Subject to change following our lecture
  end

  def logged_in?
    !!current_user
  end
end
