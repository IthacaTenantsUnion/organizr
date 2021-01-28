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
  has_many :landlords, through: :tenancies
  has_many :ratings, through: :tenancies
  has_many :tenants, through: :tenancies, source: :user

  validates :address, presence: true, uniqueness: true
end
