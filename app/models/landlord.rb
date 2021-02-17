# == Schema Information
#
# Table name: landlords
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Landlord < ApplicationRecord
  has_many :tenancies, -> { extending AverageRatings }
  alias :ratings :tenancies
  has_many :units, through: :tenancies, inverse_of: :landlords
  has_many :tenants, through: :tenancies, source: :user, inverse_of: :landlords

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
