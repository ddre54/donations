require 'spec_helper'

describe SessionsController do

  let(:valid_attributes) { {
    "name" => "Jhon Doe",
    "email" => "user@example.com",
    "password" => "examplepass",
    "password_confirmation" => "examplepass"
  } }

  let(:valid_params) { {
    "email" => "user@example.com",
    "password" => "examplepass"
  } }

  let(:valid_session) { {} }

  before do
    @user = User.create! valid_attributes
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns user session" do
        post :create, {:session => valid_params}, valid_session
        session[:user_id].should eq(@user.id)
      end

      it "redirects to the user path" do
        post :create, {:session => valid_params}, valid_session
        response.should redirect_to(@user)
        flash[:notice].should eq("Signin successful")
      end
    end

    describe "with invalid params" do
      it "display flash alert" do
        post :create, {:session => { "email" => "invalid value" }}, valid_session
        flash[:alert].should eq("Signin failed")
      end

      it "re-renders the 'new' template" do
        post :create, {:session => { "email" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    before do

    end

    it "destroys the requested user" do
      session[:user_id] = @user.id
      delete :destroy, {:user_id => @user.id}, valid_session
      session[:user_id].should be_nil
    end

    it "redirects to the users list" do
      delete :destroy, {:id => @user.id}, valid_session
      response.should redirect_to(signin_path)
      flash[:notice].should eq("Signout successful")
    end
  end
end
