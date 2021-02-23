 require 'rails_helper'

RSpec.describe "/union/tenancies", type: :request do
  let(:tenant) { create(:user, :tenant) }
  let(:admin) { create(:user, :admin) }
  let(:landlord) { create(:landlord) }

  context "While not signed in" do
    describe "GET #index" do
      it "redirects to the root with forbidden" do
        get admin_tenancies_url
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context "While signed in as a tenant" do
    before do
      sign_in(tenant)
    end

    describe "GET #index" do
      it "redirects to the root with forbidden" do
        get admin_tenancies_url
        expect(response).to redirect_to new_user_session_url
      end
    end
  end

  context "While signed in as an admin" do
    before do
      sign_in admin
    end

    describe "GET #index" do
      it "redirects to the root with forbidden" do
        get admin_tenancies_url
        expect(response).to be_successful
      end
    end
  end  
end
