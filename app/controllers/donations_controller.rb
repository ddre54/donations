class DonationsController < ApplicationController

  before_action :set_user
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  include DonationsHelper

  def index
    @donations = @user.donations
  end

  def show
  end

  def new
    @donation = @user.donations.new
  end

  def edit
  end

  def create
    donable_type = params[:donation][:donable_type]

    respond_to do |format|
      if create_donable_with_donation(donable_type, @user)
        if @donation.save
          format.html { redirect_to user_donation_path(@user, @donation), notice: 'Donation was successfully created.' }
          format.json { render action: 'show', status: :created, location: @donation }
        else
          format.html { render action: 'new' }
          format.json { render json: @donation.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @donable.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @donable = @donation.donable
    respond_to do |format|
      if @donation.update(donation_params)
        if @donation.donable.update_attributes(donable_params(donable_key(@donation.donable_type)))
          format.html { redirect_to user_donation_path(@user, @donation), notice: 'Donation was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @donation.donable.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: 'edit' }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to user_donations_url(@user) }
      format.json { head :no_content }
    end
  end

  def donable_selected
    @donable = donable_class_constant(params[:donable_type]).new
    render :partial => donable_class_name_form(params[:donable_type]), :locals => { :user => @user, :donable => @donable }
  end

  private

  def set_user
    gon.user_id = params[:user_id]
    @user = User.find(params[:user_id])
  end

  def set_donation
    @donation = Donation.find(params[:id])
  end

  def create_donable_with_donation(donable_type, user)
    @donable = donable_class_constant(donable_type).new(donable_params(donable_key(donable_type)))
    @donation = @donable.build_donation(donation_params)
    @donation.user = user
    @donable.save
  end

  def donable_class_constant(donable_type)
    string_to_class_name(donable_type).classify.constantize
  end

  def donable_content(donable_type, content)
    content[donable_key(donable_type)]
  end

  def donable_key(donable_type)
    string_to_class_name(donable_type).underscore.to_sym
  end

  def donable_params(donable_key)
    safe_attributes = {
      voucher: [ :expiration_date ],
      experience: [ :primary_contact_name, :latitude, :longitude],
      physical_item: [ :height, :weight, :width]
    }
    params.require(donable_key).permit(*safe_attributes[donable_key])
  end

  def donation_params
    safe_attributes = [:title, :description]
    params.require(:donation).permit(*safe_attributes)
  end
end
