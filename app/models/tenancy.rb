# == Schema Information
#
# Table name: tenancies
#
#  id             :bigint           not null, primary key
#  user_id        :bigint           not null
#  unit_id        :bigint           not null
#  landlord_id    :bigint           not null
#  rent_total     :integer
#  start_date     :date
#  end_date       :date
#  overall        :integer
#  repairs        :integer
#  private_review :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  public_review  :string
#  rent_portion   :integer
#

class Tenancy < ApplicationRecord
  belongs_to :tenant, class_name: 'User', foreign_key: :user_id
  belongs_to :unit
  belongs_to :landlord

  validates :rent_total, numericality: { greater_than: 0 }, if: lambda{ |t| t.rent_total.present? }
  validates :rent_portion, numericality: { greater_than: 0 }, if: lambda{ |t| t.rent_portion.present? }
  validates :start_date, presence: true
  validates :end_date, date: { after:  :start_date }, if: lambda{ |t| t.end_date.present? }
  validates :overall, inclusion: { in: 0..3 }, if: lambda{ |t| t.overall.present? }

  scope :with_ratings, -> { where.not(overall: nil) }
  scope :by_unit, ->(unit) { where(unit: unit) }
  scope :by_tenant, ->(user) { where(users: { id: user.id }) }
  scope :by_landlord, ->(landlord) { where(landlord: landlord )}

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
