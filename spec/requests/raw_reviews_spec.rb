 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/raw_reviews", type: :request do
  
  # RawReview. As you add validations to RawReview, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      RawReview.create! valid_attributes
      get raw_reviews_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      raw_review = RawReview.create! valid_attributes
      get raw_review_url(raw_review)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_raw_review_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      raw_review = RawReview.create! valid_attributes
      get edit_raw_review_url(raw_review)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new RawReview" do
        expect {
          post raw_reviews_url, params: { raw_review: valid_attributes }
        }.to change(RawReview, :count).by(1)
      end

      it "redirects to the created raw_review" do
        post raw_reviews_url, params: { raw_review: valid_attributes }
        expect(response).to redirect_to(raw_review_url(RawReview.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new RawReview" do
        expect {
          post raw_reviews_url, params: { raw_review: invalid_attributes }
        }.to change(RawReview, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post raw_reviews_url, params: { raw_review: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested raw_review" do
        raw_review = RawReview.create! valid_attributes
        patch raw_review_url(raw_review), params: { raw_review: new_attributes }
        raw_review.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the raw_review" do
        raw_review = RawReview.create! valid_attributes
        patch raw_review_url(raw_review), params: { raw_review: new_attributes }
        raw_review.reload
        expect(response).to redirect_to(raw_review_url(raw_review))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        raw_review = RawReview.create! valid_attributes
        patch raw_review_url(raw_review), params: { raw_review: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested raw_review" do
      raw_review = RawReview.create! valid_attributes
      expect {
        delete raw_review_url(raw_review)
      }.to change(RawReview, :count).by(-1)
    end

    it "redirects to the raw_reviews list" do
      raw_review = RawReview.create! valid_attributes
      delete raw_review_url(raw_review)
      expect(response).to redirect_to(raw_reviews_url)
    end
  end
end
