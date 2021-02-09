require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TenanciesHelper. For example:
#
# describe TenanciesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TenanciesHelper, type: :helper do
  include TenanciesHelper

  describe "composite_renting" do
    subject { composite_rent(tenancy) }
    context "when there's only a rent total" do
      let(:tenancy) { build(:tenancy, rent_total: 1000, rent_portion: nil) }
      it { is_expected.to eq('$1000')}
    end

    context "when there's only a rent portion" do
      let(:tenancy) { build(:tenancy, rent_total: nil, rent_portion: 1000) }
      it { is_expected.to eq('$1000 (portion)')}
    end

    context "when there is both" do
      let(:tenancy) { build(:tenancy, rent_total: 1000, rent_portion: 500) }
      it { is_expected.to eq('$500 (of $1000)')}
    end

    context "when there's neither" do
      let(:tenancy) { build(:tenancy, rent_total: nil, rent_portion: nil) }
      it { is_expected.to eq('Unknown')}
    end
  end
end
