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
class Rating < ApplicationRecord
  belongs_to :tenancy, inverse_of: :rating
  has_one :landlord, through: :tenancy, inverse_of: :ratings
  has_one :unit, through: :tenancy
  has_one :tenant, through: :tenancy
  
  validates :overall, inclusion: { in: [-1, 0, 1] }

  scope :by_unit, ->(unit) { joins(:tenancy).where(tenancies: { unit: unit })}
  scope :by_landlord, ->(landlord) { joins(:tenancy).where(tenancies: { landlord: landlord })}
end
