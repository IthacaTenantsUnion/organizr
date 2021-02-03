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
  has_many :tenancies
  has_many :landlords, through: :tenancies, inverse_of: :units
  has_many :ratings, -> { extending AverageRatings }, through: :tenancies, dependent: :destroy
  has_many :tenants, through: :tenancies, source: :user

  validates :address, presence: true, uniqueness: true
end
