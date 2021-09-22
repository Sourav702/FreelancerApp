class ApplicationController < ActionController::Base
  helper_method :current_user, :current_freelancer ,:current_admin

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
  def current_freelancer
    if session[:freelancer_id]
      @current_freelancer ||= Freelancer.find(session[:freelancer_id])
    else
      @current_freelancer = nil
    end
  end
  def current_admin
    if session[:admin_id]
      @current_admin ||= Admin.find(session[:admin_id])
    else
      @current_admin = nil
    end
  end
end
