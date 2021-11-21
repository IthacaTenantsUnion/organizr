require "rails_helper"

RSpec.describe RawReviewsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/raw_reviews").to route_to("raw_reviews#index")
    end

    it "routes to #new" do
      expect(get: "/raw_reviews/new").to route_to("raw_reviews#new")
    end

    it "routes to #show" do
      expect(get: "/raw_reviews/1").to route_to("raw_reviews#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/raw_reviews/1/edit").to route_to("raw_reviews#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/raw_reviews").to route_to("raw_reviews#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/raw_reviews/1").to route_to("raw_reviews#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/raw_reviews/1").to route_to("raw_reviews#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/raw_reviews/1").to route_to("raw_reviews#destroy", id: "1")
    end
  end
end
