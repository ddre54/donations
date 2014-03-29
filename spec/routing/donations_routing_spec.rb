require "spec_helper"

describe DonationsController do
  describe "routing" do

    it "routes to #index" do
      get("/users/1/donations").should route_to("donations#index", user_id: "1")
    end

    it "routes to #new" do
      get("/users/1/donations/new").should route_to("donations#new", user_id: "1")
    end
  end
end
