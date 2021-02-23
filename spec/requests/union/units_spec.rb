 require 'rails_helper'

RSpec.describe "/units", type: :request do
  let(:valid_attributes) {
    attributes_for(:unit)
  }

  let(:invalid_attributes) {
    { address: nil }
  }

  let(:tenant) { create(:user, :tenant) }
  let(:admin) { create(:user, :admin) }
  let(:unit) { create(:unit) }

  context "While signed in as a tenant" do
    before do
      sign_in tenant
    end

    describe "GET /index" do
      it "renders a successful response" do
        unit
        get union_units_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        get union_unit_url(unit)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_union_unit_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "does not render a successful response" do
        get edit_union_unit_url(unit)
        expect(response).not_to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Unit" do
          expect {
            post union_units_url, params: { unit: valid_attributes }
          }.to change(Unit, :count).by(1)
        end

        it "redirects to the created unit" do
          post union_units_url, params: { unit: valid_attributes }
          expect(response).to redirect_to(union_unit_url(Unit.last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Unit" do
          expect {
            post union_units_url, params: { unit: invalid_attributes }
          }.to change(Unit, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post union_units_url, params: { unit: invalid_attributes }
          expect(response.status).to eq(422)
        end
      end
    end

    describe "PATCH /update" do
      let(:new_attributes) {
        { address: "NEW ADDRESS" }
      }

      it "does nothing, no access" do
        patch union_unit_url(unit), params: { unit: new_attributes }
        expect(response).to redirect_to new_user_session_url
      end
    end

    describe "DELETE /destroy" do
      it "redirects to the units list" do
        unit
        expect do
          delete union_unit_url(unit)
        end.not_to change(Unit,:count)
        expect(response).to be_redirect
      end
    end
  end

  context "While signed in as an admin" do
    before do
      sign_in admin
    end

    describe "GET /index" do
      it "renders a successful response" do
        Unit.create! valid_attributes
        get union_units_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        unit = Unit.create! valid_attributes
        get union_unit_url(unit)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_union_unit_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "render a successful response" do
        unit = Unit.create! valid_attributes
        get edit_union_unit_url(unit)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Unit" do
          expect {
            post union_units_url, params: { unit: valid_attributes }
          }.to change(Unit, :count).by(1)
        end

        it "redirects to the created unit" do
          post union_units_url, params: { unit: valid_attributes }
          expect(response).to redirect_to(union_unit_url(Unit.last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Unit" do
          expect {
            post union_units_url, params: { unit: invalid_attributes }
          }.to change(Unit, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post union_units_url, params: { unit: invalid_attributes }
          expect(response.status).to eq(422)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          { address: "NEW ADDRESS" }
        }

        it "updates the requested unit" do
          unit = Unit.create! valid_attributes
          patch union_unit_url(unit), params: { unit: new_attributes }
          unit.reload
          expect(unit.address).to eq(new_attributes[:address])
        end

        it "redirects to the unit" do
          unit = Unit.create! valid_attributes
          patch union_unit_url(unit), params: { unit: new_attributes }
          unit.reload
          expect(response).to redirect_to(union_unit_url(unit))
        end
      end

      context "with invalid parameters" do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          unit = Unit.create! valid_attributes
          patch union_unit_url(unit), params: { unit: invalid_attributes }
          expect(response.status).to eq(422)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested unit" do
        unit = Unit.create! valid_attributes
        expect {
          delete union_unit_url(unit)
        }.to change(Unit, :count).by(-1)
      end

      it "redirects to the units list" do
        unit = Unit.create! valid_attributes
        delete union_unit_url(unit)
        expect(response).to redirect_to(union_units_url)
      end
    end    
  end
end
