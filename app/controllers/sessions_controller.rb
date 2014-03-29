class SessionsController < ApplicationController
  layout 'application'

  skip_before_filter :authorize

  def new
  end

  def create
    user = User.where(email: params[:session][:email]).first
    if user and user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Signin successful"
    else
      flash[:error] = "Signin failed"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to signin_path, notice: "Signout successful"
  end
end
