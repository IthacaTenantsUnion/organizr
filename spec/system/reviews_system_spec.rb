require "rails_helper"

RSpec.describe "Reviews", :type => :system do
  let(:public_review) { "Public Text" }
  let(:private_review) { "Private Text" }
  let(:tenancy){ FactoryBot.create(:tenancy, :with_rating, public_review: public_review, private_review: private_review) }


  context "When not signed in" do
    it "displays public, but not private, review data" do
      visit rating_path(tenancy)
      expect(page).to have_text public_review
      expect(page).to have_no_text private_review

      visit landlord_path(tenancy.landlord)
      expect(page).to have_text public_review
      expect(page).to have_no_text private_review

      visit unit_path(tenancy.unit)
      expect(page).to have_text public_review
      expect(page).to have_no_text private_review
    end
  end

  context "When signed in" do
    before do
      sign_in(create(:user))
    end

    it "displays both public and private review data in the Union ratings view" do
      visit union_tenancy_path(tenancy)
      expect(page).to have_text public_review
      expect(page).to have_text private_review

      visit union_landlord_path(tenancy.landlord)
      expect(page).to have_text public_review
      expect(page).to have_text private_review

      visit union_unit_path(tenancy.unit)
      expect(page).to have_text public_review
      expect(page).to have_text private_review      
    end
  end
end