# == Schema Information
#
# Table name: units
#
#  id                  :bigint           not null, primary key
#  address             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  number_of_occupants :integer          default(1)
#  building_type       :string
#
class Unit < ApplicationRecord
  has_many :leases, -> { extending AverageRatings }
  
  has_many :landlords, through: :leases, inverse_of: :units
  has_many :tenants, through: :leases, source: :user

  validates :address, presence: true, uniqueness: true
  validates :number_of_occupants, numericality: { greater_than: 0 }

  enum building_type: {
    single_unit: "Single-unit house",
    multi_unit: "Multi-unit (converted) house",
    apt_complex: "Apartment complex",
    program_housing: "Program housing"
  }
end
