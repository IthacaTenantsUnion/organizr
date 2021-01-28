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
  has_many :tenancies
  has_many :units, through: :tenancies, inverse_of: :landlord
  has_many :tenants, through: :tenancies, source: :user, inverse_of: :landlord
  has_many :ratings, through: :tenancies, inverse_of: :landlord

  validates :name, presence: true, uniqueness: true
end
