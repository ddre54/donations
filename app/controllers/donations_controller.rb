class DonationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @donations = @user.donations
  end

  def new
    @user = User.find(params[:user_id])
    @donation = @user.donations.new
  end
end
