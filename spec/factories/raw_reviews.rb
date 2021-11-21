FactoryBot.define do
  factory :raw_review do
    landlord_public_review { "MyText" }
    landlord_private_review { "MyText" }
    landlord_general_rating { "" }
    landlord_repairs_rating { "" }
    security_deposit { "MyString" }
    lease_end_date { "2021-11-20 21:15:27" }
    landlord_name { "MyString" }
    property_manager { "MyString" }
    submitter_ip_address { "MyString" }
    preferred_contact { "MyString" }
    rent { "" }
  end
end
