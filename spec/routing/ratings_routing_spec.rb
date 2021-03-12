require "rails_helper"

RSpec.describe RatingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ratings").to route_to("ratings#index")
    end

    it "routes to #show" do
      expect(get: "/ratings/1").to route_to("ratings#show", id: "1")
    end
  end
end
