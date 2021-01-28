# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  overall    :integer
#  repairs    :integer
#  review     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Rating < ApplicationRecord
  has_one :tenancy
  belongs_to :user
  
  delegate :landlord, to: :tenancy
  delegate :unit, to: :tenancy

  validates :overall, presence: true
end
