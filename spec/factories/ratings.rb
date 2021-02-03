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
FactoryBot.define do
  factory :rating do
    tenancy
    overall { [-1,0,1].sample }
    repairs { [-1,0,1].sample }
    review { Faker::Lorem.paragraph_by_chars(number: (Random.random_number * 900).to_i + 100, supplemental: true) }

    trait :for_landlord do
      transient do
        landlord { nil }
      end

      after(:build) do |rating, factory|
        rating.tenancy = create(:tenancy, landlord: factory.landlord)
      end
    end
  end
end
