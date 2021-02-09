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
FactoryBot.define do
  factory :tenancy do
    tenant factory: :user
    unit
    landlord
    rent_total { (Random.random_number * 1500).to_i + 500 }
    rent_portion { rent_total / (1..3).to_a.sample }
    start_date { Faker::Date.between(from: 3.years.ago, to: 1.year.ago) }
    end_date { nil }

    trait :with_rating do
      overall { (0..3).to_a.sample }
      repairs { (0..3).to_a.sample }
      public_review { Faker::Lorem.paragraph_by_chars(number: (Random.random_number * 400).to_i + 100, supplemental: true) }
      private_review { Faker::Lorem.paragraph_by_chars(number: (Random.random_number * 900).to_i + 100, supplemental: true) }
    end
  end
end
