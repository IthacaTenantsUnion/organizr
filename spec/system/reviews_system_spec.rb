require "rails_helper"

RSpec.describe "Reviews", :type => :system do
  let(:public_review) { "Public Text" }
  let(:private_review) { "Private Text" }
  let(:rating){ FactoryBot.create(:rating, public_review: public_review, private_review: private_review) }


  context "When not signed in" do
    it "displays public, but not private, review data" do
      visit rating_path(rating)
      expect(page).to have_text public_review
      expect(page).to have_no_text private_review

      visit landlord_path(rating.landlord)
      expect(page).to have_text public_review
      expect(page).to have_no_text private_review

      visit unit_path(rating.unit)
      expect(page).to have_text public_review
      expect(page).to have_no_text private_review
    end
  end

  context "When signed in" do
    before do
      sign_in(create(:user, :tenant))
    end

    it "displays both public and private review data in the Union ratings view" do
      visit rating_path(rating)
      expect(page).to have_text public_review
      expect(page).to have_text private_review
    end
  end
end