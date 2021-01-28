# == Schema Information
#
# Table name: units
#
#  id          :bigint           not null, primary key
#  address     :string
#  landlord_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Unit < ApplicationRecord
  belongs_to :landlord

  validates :address, presence: true, uniqueness: true
end
