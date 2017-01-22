class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end

  def require_student
    redirect_to '/' unless current_user.student?
  end
  def require_ta
    redirect_to '/' unless current_user.ta?
  end
  def require_instructor
    redirect_to '/' unless current_user.instructor?
  end
end
