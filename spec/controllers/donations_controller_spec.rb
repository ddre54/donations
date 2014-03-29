require 'spec_helper'

describe DonationsController do

  let(:user) { create(:user) }
  let(:physical_donation) { create(:physical_donation, user: user) }
  let(:voucher_donation) { create(:voucher_donation, user: user) }
  let(:experience_donation) { create(:experience_donation, user: user) }

  let(:donations) { [
    physical_donation,
    voucher_donation,
    experience_donation
  ] }

  let(:valid_session) { {
    "user_id" => user.id
  } }

  let(:valid_attributes) { {
    "user_id" => user.id
  } }

  describe "GET index" do
    it "assigns the user as @user" do
      get :index, valid_attributes, valid_session
      response.should be_success
      assigns(:user).should eq(user)
    end

    it "assigns all donations of the user as @donations" do
      get :index, valid_attributes, valid_session
      response.should be_success
      assigns(:donations).should eq(donations)
    end
  end

  describe "GET new" do
    it "assigns a new donation to @donation" do
      get :new, valid_attributes, valid_session
      assigns(:donation).should be_a_new(Donation)
    end
  end

end
