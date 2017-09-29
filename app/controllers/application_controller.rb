class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def authorize_user
    unless current_user.present?
      redirect_to root_path, alert: 'Not authorized!'
    end
  end
end
