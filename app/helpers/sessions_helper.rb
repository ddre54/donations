module SessionsHelper
  def session_authenticated?
    !session[:user_id].nil?
  end
end
