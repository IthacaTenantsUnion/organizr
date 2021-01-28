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

RSpec.describe "/landlords", type: :request do
  # Landlord. As you add validations to Landlord, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Landlord.create! valid_attributes
      get landlords_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      landlord = Landlord.create! valid_attributes
      get landlord_url(landlord)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_landlord_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      landlord = Landlord.create! valid_attributes
      get edit_landlord_url(landlord)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Landlord" do
        expect {
          post landlords_url, params: { landlord: valid_attributes }
        }.to change(Landlord, :count).by(1)
      end

      it "redirects to the created landlord" do
        post landlords_url, params: { landlord: valid_attributes }
        expect(response).to redirect_to(landlord_url(Landlord.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Landlord" do
        expect {
          post landlords_url, params: { landlord: invalid_attributes }
        }.to change(Landlord, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post landlords_url, params: { landlord: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested landlord" do
        landlord = Landlord.create! valid_attributes
        patch landlord_url(landlord), params: { landlord: new_attributes }
        landlord.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the landlord" do
        landlord = Landlord.create! valid_attributes
        patch landlord_url(landlord), params: { landlord: new_attributes }
        landlord.reload
        expect(response).to redirect_to(landlord_url(landlord))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        landlord = Landlord.create! valid_attributes
        patch landlord_url(landlord), params: { landlord: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested landlord" do
      landlord = Landlord.create! valid_attributes
      expect {
        delete landlord_url(landlord)
      }.to change(Landlord, :count).by(-1)
    end

    it "redirects to the landlords list" do
      landlord = Landlord.create! valid_attributes
      delete landlord_url(landlord)
      expect(response).to redirect_to(landlords_url)
    end
  end
end
