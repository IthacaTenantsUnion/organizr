# == Schema Information
#
# Table name: units
#
#  id         :bigint           not null, primary key
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Unit < ApplicationRecord
  has_many :tenancies, -> { extending AverageRatings }
  alias :ratings :tenancies
  has_many :landlords, through: :tenancies, inverse_of: :units
  has_many :tenants, through: :tenancies, source: :user

  validates :address, presence: true, uniqueness: true
  validates :number_of_occupants, numericality: { greater_than: 0 }
end
