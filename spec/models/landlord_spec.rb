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
end
