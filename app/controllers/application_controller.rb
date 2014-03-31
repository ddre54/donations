class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate

  protected

  def authenticate
    unless User.find_by_id(session[:user_id])
      redirect_to signin_url, notice: "Please sign in"
    end
  end

  def authorize
    # TODO: Implement roles
    user = User.where(id: session[:user_id]).first
    unless user && user.try(:is_admin?)
      render :file => "public/401.html", :status => :unauthorized
    end
  end

end
