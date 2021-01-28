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
  has_many :units, inverse_of: :landlord
  has_many :ratings, through: :units

  validates :name, presence: true, uniqueness: true
end
