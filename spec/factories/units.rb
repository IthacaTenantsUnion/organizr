# == Schema Information
#
# Table name: units
#
#  id                  :bigint           not null, primary key
#  address             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  number_of_occupants :integer          default(1)
#  building_type       :string
#
FactoryBot.define do
  factory :unit do
    address { Faker::Address.street_address }
  end
end
