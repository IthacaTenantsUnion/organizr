# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  unit_id    :bigint           not null
#  overall    :integer
#  repairs    :integer
#  review     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :unit

  delegate :landlord, to: :unit
end
