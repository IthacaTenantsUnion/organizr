require "rails_helper"

RSpec.describe LandlordsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/landlords").to route_to("landlords#index")
    end

    it "routes to #show" do
      expect(get: "/landlords/1").to route_to("landlords#show", id: "1")
    end
  end
end
