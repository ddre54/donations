require "spec_helper"

describe SessionsController do
  describe "routing" do

    it "routes signin to #new" do
      get("/signin").should route_to("sessions#new")
    end

    it "routes to #new" do
      get("/sessions/new").should route_to("sessions#new")
    end

    it "routes post signin to #create" do
      post("/signin").should route_to("sessions#create")
    end

    it "routes to #create" do
      post("/sessions").should route_to("sessions#create")
    end

    it "routes to #destroy" do
      delete("/users/1").should route_to("users#destroy", :id => "1")
    end

    it "routes signout to #destroy" do
      delete("/users/1").should route_to("users#destroy", :id => "1")
    end

  end
end
