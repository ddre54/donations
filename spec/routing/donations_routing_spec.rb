require "spec_helper"

describe DonationsController do
  describe "routing" do

    it "routes to #index" do
      get("/users/1/donations").should route_to("donations#index", user_id: "1")
    end

    it "routes to #new" do
      get("/users/1/donations/new").should route_to("donations#new", user_id: "1")
    end

    it "routes to #show" do
      get("/users/1/donations/6").should route_to("donations#show", { user_id: "1", id: "6" } )
    end

    it "routes to #edit" do
      get("/users/1/donations/6/edit").should route_to("donations#edit", { user_id: "1", id: "6" } )
    end

    it "routes to #create" do
      post("/users/1/donations").should route_to("donations#create", { user_id: "1" } )
    end

    it "routes to #update" do
      put("/users/1/donations/6").should route_to("donations#update", { user_id: "1", id: "6" } )
    end

    it "routes to #delete" do
      delete("/users/1/donations/6").should route_to("donations#destroy", { user_id: "1", id: "6" } )
    end
  end
end
