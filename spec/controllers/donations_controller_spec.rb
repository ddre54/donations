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

  let(:valid_donation_with_donable_attributes) { {
    "user_id" => user.id,
    "donation" => {
      "title" => "Awesome title",
      "description" => "A nice description",
      "donable_type" => "PhysicalItem"
    },
    "physical_item" => {
      "height"=>"10",
      "weight"=>"222",
      "width"=>"11"
    }
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

  describe "GET show" do
    it "assigns the requested donation as @donation" do
      valid_request_params = {
        :user_id => user.to_param,
        :id => physical_donation.to_param
      }
      get :show, valid_request_params, valid_session
      assigns(:donation).should eq(physical_donation)
    end
  end

  describe "GET new" do
    it "assigns a new donation to @donation" do
      get :new, valid_attributes, valid_session
      assigns(:donation).should be_a_new(Donation)
    end
  end

  describe "GET edit" do
    it "assigns the requested donation as @donation" do
      valid_request_params = {
        :user_id => user.to_param,
        :id => physical_donation.to_param
      }
      get :edit, valid_request_params, valid_session
      assigns(:donation).should eq(physical_donation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Donation" do
        expect {
          post :create, valid_donation_with_donable_attributes, valid_session
        }.to change(Donation, :count).by(1)
      end

      it "creates a new Donable of PhysicalItem" do
        expect {
          post :create, valid_donation_with_donable_attributes, valid_session
        }.to change(PhysicalItem, :count).by(1)
      end

      it "assigns a newly created donation as @donation" do
        post :create, valid_donation_with_donable_attributes, valid_session
        assigns(:donation).should be_a(Donation)
        assigns(:donation).should be_persisted
        assigns(:donable).should be_a(PhysicalItem)
        assigns(:donable).should be_persisted
      end

      it "redirects to the created donation" do
        post :create, valid_donation_with_donable_attributes, valid_session
        response.should redirect_to(user_donation_path(user, Donation.last))
      end
    end

    describe "with invalid params" do
      let(:invalid_params) { {
        :user_id => user.id,
        :donation => {
          "title" => "invalid value",
          "donable_type" => "PhysicalItem"
        },
        :physical_item => {
          :width => "11"
        }
      } }
      it "assigns a newly created but unsaved donation as @donation" do
        # Trigger the behavior that occurs when invalid params are submitted
        Donation.any_instance.stub(:save).and_return(false)
        post :create, invalid_params, valid_session
        assigns(:donation).should be_a_new(Donation)
      end

      it "assigns a newly created but unsaved donable as @donable" do
        # Trigger the behavior that occurs when invalid params are submitted
        PhysicalItem.any_instance.stub(:save).and_return(false)
        post :create, invalid_params, valid_session
        assigns(:donable).should be_a_new(PhysicalItem)
      end

      it "re-renders the 'new' template no donation created" do
        # Trigger the behavior that occurs when invalid params are submitted
        Donation.any_instance.stub(:save).and_return(false)
        post :create, invalid_params, valid_session
        response.should render_template("new")
      end

      it "re-renders the 'new' template no donable created" do
        # Trigger the behavior that occurs when invalid params are submitted
        PhysicalItem.any_instance.stub(:save).and_return(false)
        post :create, invalid_params, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:valid_update_attributes){ {
        :id => physical_donation.id,
        :user_id => user.id,
        :donation => {
          "title" => "Updated title"
        },
        :physical_item => {
          "width" => "11"
        }
      }}

      it "updates the requested donation" do
        Donation.any_instance.should_receive(:update).with({ "title" => "Updated title" })
        put :update, valid_update_attributes, valid_session
      end

      it "updates the requested donation donable" do
        PhysicalItem.any_instance.should_receive(:update_attributes).with({ "width" => "11" })
        put :update, valid_update_attributes, valid_session
      end

      it "assigns the requested donation as @donation" do
        put :update, valid_update_attributes, valid_session
        assigns(:donation).should eq(physical_donation)
      end

      it "assigns the requested donation donable as @donable" do
        put :update, valid_update_attributes, valid_session
        assigns(:donable).should eq(physical_donation.donable)
      end

      it "redirects to the donations" do
        put :update, valid_update_attributes, valid_session
        response.should redirect_to(user_donation_path(user, physical_donation))
      end
    end

    describe "with invalid params" do
      let(:invalid_update_params) { {
        :user_id => user.to_param,
        :id => physical_donation.id,
        :donation => {
          "no" => "invalid value"
        },
        :physical_item => {
          "name" => "invalid"
        }
      }}

      it "assigns the donation as @donation" do
        # Trigger the behavior that occurs when invalid params are submitted
        Donation.any_instance.stub(:save).and_return(false)
        put :update, invalid_update_params, valid_session
        assigns(:donation).should eq(physical_donation)
      end

      it "assigns the donation donable as @donable" do
        # Trigger the behavior that occurs when invalid params are submitted
        PhysicalItem.any_instance.stub(:save).and_return(false)
        put :update, invalid_update_params, valid_session
        assigns(:donable).should eq(physical_donation.donable)
      end

      it "re-renders the 'edit' template when donation invalid" do
        # Trigger the behavior that occurs when invalid params are submitted
        Donation.any_instance.stub(:save).and_return(false)
        put :update, invalid_update_params, valid_session
        response.should render_template("edit")
      end

      it "re-renders the 'edit' template when donable invalid" do
        # Trigger the behavior that occurs when invalid params are submitted
        PhysicalItem.any_instance.stub(:save).and_return(false)
        put :update, invalid_update_params, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before do
      @valid_request_params = {
        :user_id => user.to_param,
        :id => physical_donation.to_param
      }
    end
    it "destroys the requested donation" do
      expect {
        delete :destroy, @valid_request_params, valid_session
      }.to change(Donation, :count).by(-1)
    end

    it "redirects to the user donations list" do
      delete :destroy, @valid_request_params, valid_session
      response.should redirect_to(user_donations_url(user))
    end
  end

  describe "GET donable_selected" do
    let(:valid_donable_selected_attributes) { {
      user_id: user.id,
      id: physical_donation.id,
      donable_type: "PhysicalItem"
    } }

    it "assigns a new donable class as @donable" do
      get :donable_selected, valid_donable_selected_attributes, valid_session
      assigns(:donable).should be_a_new(PhysicalItem)
    end

    it "renders partial form for that donable class" do
      get :donable_selected, valid_donable_selected_attributes, valid_session
      response.should render_template("donations/donables/_physical_item_form")
    end
  end

end
