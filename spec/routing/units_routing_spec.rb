require "rails_helper"

RSpec.describe UnitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/units").to route_to("units#index")
    end

    it "routes to #show" do
      expect(get: "/units/1").to route_to("units#show", id: "1")
    end
  end
end
