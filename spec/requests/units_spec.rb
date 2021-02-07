 require 'rails_helper'

RSpec.describe "/units", type: :request do
  describe "GET /index" do
    it "renders a successful response" do
      create(:unit)
      get units_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      unit = create(:unit)
      get unit_url(unit)
      expect(response).to be_successful
    end
  end
end
