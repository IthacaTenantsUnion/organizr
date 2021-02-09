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

    { 'F' => [0.1, 0.9], 'D' => [1, 1.49], 'C' => [1.5, 1.9], 'B' => [2, 2.49], 'A' => [2.5, 3]}.each do |grade, scores|
      scores.each do |score|
        context "with a score of #{score}" do
          let(:rating) { score }
          it { is_expected.to eq(grade) }
        end
      end
    end
  end
end
