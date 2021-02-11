# == Schema Information
#
# Table name: units
#
#  id         :bigint           not null, primary key
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Unit, type: :model do
  describe "Validations" do
    it "is invalid without an address" do
      expect(build(:unit, address: nil)).to be_invalid
    end

    it "is invalid with a duplicate address" do
      existing = create(:unit)
      expect(build(:unit, address: existing.address)).to be_invalid
    end

    it "is invalid with a zero or negative number of occupants" do
      expect(build(:unit, number_of_occupants: 0)).to be_invalid
      expect(build(:unit, number_of_occupants: -1)).to be_invalid
    end
  end

  describe "Ratings calculations" do
    subject { create(:unit) }
    include_examples "average_ratings", :unit
  end
end
