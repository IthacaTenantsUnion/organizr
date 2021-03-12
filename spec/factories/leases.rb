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
FactoryBot.define do
  factory :lease do
    user
    unit
    landlord
    rent_total { (Random.random_number * 1500).to_i + 500 }
    rent_portion { rent_total / (1..3).to_a.sample }
    start_date { Faker::Date.between(from: 3.years.ago, to: 1.year.ago) }
    end_date { nil }
  end
end