require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RatingsHelper. For example:
#
# describe RatingsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe RatingsHelper, type: :helper do
  include RatingsHelper

  describe "clamp_rating" do
    subject { clamp_rating(rating) }

    context "when the value is under -0.3" do
      let(:rating) { -0.301 }
      it { is_expected.to eq(-1) }
    end

    context "when the value is -0.3" do
      let(:rating) { -0.3 }
      it { is_expected.to eq(0) }
    end

    context "when the value is under 0.3" do
      let(:rating) { 0.2999999 }
      it { is_expected.to eq(0) }
    end

    context "when the value is 0.3 and up" do
      let(:rating) { 0.3 }
      it { is_expected.to eq(1) }
    end
  end
end
