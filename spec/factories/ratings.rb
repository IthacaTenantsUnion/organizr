# == Schema Information
#
# Table name: ratings
#
#  id             :bigint           not null, primary key
#  user_id        :integer
#  unit_id        :integer
#  landlord_id    :integer
#  overall        :integer
#  repairs        :integer
#  public_review  :string
#  private_review :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :rating do
    user
    unit
    landlord
    overall { (0..3).to_a.sample }
    repairs { (0..3).to_a.sample }
    public_review { Faker::Lorem.paragraph_by_chars(number: (Random.random_number * 400).to_i + 100, supplemental: true) }
    private_review { Faker::Lorem.paragraph_by_chars(number: (Random.random_number * 900).to_i + 100, supplemental: true) }
  end
end
