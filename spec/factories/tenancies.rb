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
FactoryBot.define do
  factory :tenancy do
    tenant factory: :user
    unit
    landlord
    rent { (Random.random_number * 1500).to_i + 500 }
    start_date { Faker::Date.between(from: 3.years.ago, to: 1.year.ago) }
    end_date { nil }

    trait :with_rating do
      rating
    end
  end
end
