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
end
