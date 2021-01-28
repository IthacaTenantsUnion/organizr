require "rails_helper"

RSpec.describe LandlordsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/landlords").to route_to("landlords#index")
    end

    it "routes to #new" do
      expect(get: "/landlords/new").to route_to("landlords#new")
    end

    it "routes to #show" do
      expect(get: "/landlords/1").to route_to("landlords#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/landlords/1/edit").to route_to("landlords#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/landlords").to route_to("landlords#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/landlords/1").to route_to("landlords#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/landlords/1").to route_to("landlords#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/landlords/1").to route_to("landlords#destroy", id: "1")
    end
  end
end
