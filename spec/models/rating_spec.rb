# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  tenancy_id :bigint           not null
#  overall    :integer
#  repairs    :integer
#  review     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe "Validations" do
    it "is invalid without an overall rating" do
      expect(build(:rating, overall: nil)).to be_invalid
    end
  end

  describe "Scopes" do
    describe "by_unit" do
      let(:unit) { create(:unit) }

      before do
        create(:rating)
        create(:rating, unit: unit)
      end

      it "constrains ratings to just the provided unit" do
        expect(Rating.by_unit(unit).size).to eq(1)
      end
    end

    describe "by_landlord" do
      let(:landlord) { create(:landlord) }

      before do
        create(:rating)
        create(:rating, landlord: landlord)
      end
      it "constrains ratings to just the provided landlord" do
        expect(Rating.by_landlord(landlord).size).to eq(1)
      end
    end
  end
end
