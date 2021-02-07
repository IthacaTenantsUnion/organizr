 require 'rails_helper'

RSpec.describe "/landlords", type: :request do
  describe "GET /index" do
    it "renders a successful response" do
      create(:landlord)
      get landlords_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      landlord = create(:landlord)
      get landlord_url(landlord)
      expect(response).to be_successful
    end
  end
end
