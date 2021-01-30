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
  
  delegate :landlord, to: :tenancy
  delegate :unit, to: :tenancy
  delegate :user, to: :tenancy
  delegate :user_id, to: :tenancy
  
  validates :overall, presence: true
end
