# == Schema Information
#
# Table name: units
#
#  id          :bigint           not null, primary key
#  address     :string
#  landlord_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :unit do
    address { Faker::Address.street_address }
    landlord
  end
end
