FactoryBot.define do
  factory :rating do
    user { nil }
    landlord { nil }
    overall { 1 }
    repairs { 1 }
    review { "MyString" }
  end
end
