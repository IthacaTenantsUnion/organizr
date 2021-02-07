require "rails_helper"

RSpec.describe Union::UnitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/union/units").to route_to("union/units#index")
    end

    it "routes to #new" do
      expect(get: "/union/units/new").to route_to("union/units#new")
    end

    it "routes to #show" do
      expect(get: "/union/units/1").to route_to("union/units#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/union/units/1/edit").to route_to("union/units#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/union/units").to route_to("union/units#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/union/units/1").to route_to("union/units#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/union/units/1").to route_to("union/units#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/union/units/1").to route_to("union/units#destroy", id: "1")
    end
  end
end
