# == Schema Information
#
# Table name: landlords
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :landlord do
    name { Faker::Name.name }
  end
end
