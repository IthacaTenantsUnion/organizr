# == Schema Information
#
# Table name: landlords
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Landlord, type: :model do
  describe "Validations" do
    it "is invalid without a name" do
      expect(build(:landlord, name: nil)).to be_invalid
    end

    it "is invalid with a duplicate name" do
      existing = create(:landlord)
      expect(build(:landlord, name: existing.name)).to be_invalid
    end
  end 

  describe "Ratings" do
    let(:landlord) { create(:landlord) }

    describe "overall_average" do
      it "averages the total ratings" do
        create(:rating, :for_landlord, landlord: landlord, overall: 1)
        create(:rating, :for_landlord, landlord: landlord, overall: -1)
        create(:rating, :for_landlord, landlord: landlord, overall: 1)
        create(:rating, :for_landlord, landlord: landlord, overall: -1)
        create(:rating, :for_landlord, landlord: landlord, overall: 1)

        expect(landlord.ratings.overall_average).to eq((3-2)/5.0)
      end
    end

    describe "repairs_average" do
      it "averages the total ratings" do
        create(:rating, :for_landlord, landlord: landlord, repairs: -1)
        create(:rating, :for_landlord, landlord: landlord, repairs: -1)
        create(:rating, :for_landlord, landlord: landlord, repairs: 1)
        create(:rating, :for_landlord, landlord: landlord, repairs: -1)
        create(:rating, :for_landlord, landlord: landlord, repairs: 1)

        expect(landlord.ratings.repairs_average).to eq((2-3)/5.0)
      end

      it "calculates correctly even with missing ratings" do
        create(:rating, :for_landlord, landlord: landlord, repairs: nil)
        create(:rating, :for_landlord, landlord: landlord, repairs: nil)
        create(:rating, :for_landlord, landlord: landlord, repairs: 1)
        create(:rating, :for_landlord, landlord: landlord, repairs: -1)
        create(:rating, :for_landlord, landlord: landlord, repairs: 1)

        expect(landlord.ratings.repairs_average).to eq((2-1)/3.0)
      end
    end
  end
end
