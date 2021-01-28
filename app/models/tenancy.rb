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
  belongs_to :rating, optional: true

  validates :rent, numericality: { greater_than: 0 }
  validates :start_date, presence: true, date: { after:  :start_date}

end
