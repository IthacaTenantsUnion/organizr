# == Schema Information
#
# Table name: tenancies
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  unit_id     :bigint           not null
#  landlord_id :bigint           not null
#  rent        :integer
#  start_date  :date
#  end_date    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tenancy < ApplicationRecord
  belongs_to :user
  belongs_to :unit
  belongs_to :landlord
  has_one :rating, inverse_of: :tenancy

  validates :rent, numericality: { greater_than: 0 } # length limit
  validates :start_date, presence: true
  validates :end_date, date: { after:  :start_date }, if: lambda{ |t| t.end_date.present? }

end
