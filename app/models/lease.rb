# == Schema Information
#
# Table name: leases
#
#  id           :bigint           not null, primary key
#  user_id      :integer
#  unit_id      :integer
#  landlord_id  :integer
#  rent_portion :integer
#  rent_total   :integer
#  start_date   :date
#  end_date     :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Lease < ApplicationRecord
  belongs_to :user
  belongs_to :unit
  belongs_to :landlord

  validates :rent_total, numericality: { greater_than: 0 }, if: lambda{ |t| t.rent_total.present? }
  validates :rent_portion, numericality: { greater_than: 0 }, if: lambda{ |t| t.rent_portion.present? }
  validates :start_date, presence: true
  validates :end_date, date: { after:  :start_date }, if: lambda{ |t| t.end_date.present? }

end
