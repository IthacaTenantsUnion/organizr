 require 'rails_helper'

RSpec.describe "/union/landlords", type: :request do
  let(:valid_attributes) {
    attributes_for(:landlord)
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  let(:tenant) { create(:user, :tenant) }
  let(:admin) { create(:user, :admin) }
  let(:landlord) { create(:landlord) }

  context "While signed in as a tenant" do
    before do
      sign_in(tenant)
    end

    describe "GET /index" do
      it "renders a successful response" do
        landlord
        get union_landlords_url
        expect(response).to be_successful
      end
    end


    describe "GET /show" do
      it "renders a successful response" do
        get union_landlord_url(landlord)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_union_landlord_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "does not render a successful response" do
        get edit_union_landlord_url(landlord)
        expect(response).not_to be_successful
      end
    end

    describe "PUT /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          { name: "Johnny McNewname" }
        }

        it "does nothing, no access" do
          patch union_landlord_url(landlord), params: { landlord: new_attributes }
          expect(response).to redirect_to new_user_session_url
        end
      end
    end
    describe "DELETE /destroy" do
      context "as a tenant" do
        it "denies access" do
          landlord
          delete union_landlord_url(landlord)
          expect(response).to be_redirect
        end
      end
    end
  end

  context "While signed in as an admin" do
    before do
      sign_in admin
    end

    describe "GET /edit" do
      it "renders a successful response" do
        get edit_union_landlord_url(landlord)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Landlord" do
          expect {
            post union_landlords_url, params: { landlord: valid_attributes }
          }.to change(Landlord, :count).by(1)
        end

        it "redirects to the created landlord" do
          post union_landlords_url, params: { landlord: valid_attributes }
          expect(response).to redirect_to(union_landlord_url(Landlord.last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Landlord" do
          expect do
            post union_landlords_url, params: { landlord: invalid_attributes }
          end.to change(Landlord, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post union_landlords_url, params: { landlord: invalid_attributes }
          expect(response.status).to eq(422)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          { name: "Johnny McNewname" }
        }
        
        it "updates the requested landlord" do
          expect do
            patch union_landlord_url(landlord), params: { landlord: new_attributes }
            landlord.reload
          end.to change{landlord.name}.to(new_attributes[:name])
        end

        it "redirects to the landlord" do
          patch union_landlord_url(landlord), params: { landlord: new_attributes }
          landlord.reload
          expect(response).to redirect_to(union_landlord_url(landlord))
        end

        context "with invalid parameters" do
          it "renders a successful response (i.e. to display the 'edit' template)" do
            patch union_landlord_url(landlord), params: { landlord: invalid_attributes }
            expect(response.status).to eq(422)
          end
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested landlord" do
        landlord
        expect do
          delete union_landlord_url(landlord)
        end.to change(Landlord, :count).by(-1)
      end

      it "redirects to the landlords list" do
        delete union_landlord_url(landlord)
        expect(response).to redirect_to(union_landlords_url)
      end
    end
  end  
end
