# == Schema Information
#
# Table name: ratings
#
#  id             :bigint           not null, primary key
#  user_id        :integer
#  unit_id        :integer
#  landlord_id    :integer
#  overall        :integer
#  repairs        :integer
#  public_review  :string
#  private_review :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :unit
  belongs_to :landlord

  validates :overall, inclusion: { in: 0..3 }, if: lambda{ |t| t.overall.present? }

  def landlord_name
    landlord&.name
  end

  def unit_address
    unit&.address
  end
  
  def reviewed?
    !public_review.blank? || 
    overall.present? || 
    repairs.present?
  end
end
