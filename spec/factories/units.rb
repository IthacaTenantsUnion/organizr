# == Schema Information
#
# Table name: units
#
#  id         :bigint           not null, primary key
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :unit do
    address { Faker::Address.street_address }
  end
end
