# == Schema Information
#
# Table name: tenancies
#
#  id             :bigint           not null, primary key
#  user_id        :bigint           not null
#  unit_id        :bigint           not null
#  landlord_id    :bigint           not null
#  rent           :integer
#  start_date     :date
#  end_date       :date
#  overall        :integer
#  repairs        :integer
#  private_review :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  public_review  :string
#
require 'rails_helper'

RSpec.describe Tenancy, type: :model do
  describe "Validations" do
    it "is invalid with a negative rent" do
      expect(build(:tenancy, rent: -1)).to be_invalid
    end

    it "is invalid without a start date" do
      expect(build(:tenancy, start_date: nil)).to be_invalid
    end

    it "is valid with an empty end date" do
      expect(build(:tenancy)).to be_valid
    end

    it "is invalid with an end date that precedes the start date" do
      expect(build(:tenancy, start_date: Date.today, end_date: Date.yesterday)).to be_invalid
    end
  end

  describe "Scopes" do
    describe "by_unit" do
      it "constrains set to the unit provided" do
        create_list(:tenancy, 2)
        expect(Tenancy.by_unit(Unit.last).size).to eq(1)
      end
    end
  end
end
