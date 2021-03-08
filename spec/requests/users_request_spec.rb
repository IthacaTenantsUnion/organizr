require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  context "while signed in as a tenant" do
    before do
      sign_in user
    end

    describe 'GET :edit' do
      context "while editing yourself" do
        subject { get edit_user_registration_url(user) }
        it { is_expected.to eq 200 }
      end

      context "when editing someone who isn't you" do
        let!(:other_user) { create(:user) }
        subject { get edit_user_registration_url(other_user) }
        it { is_expected.not_to eq 401 }
      end
    end
  end
  
end
