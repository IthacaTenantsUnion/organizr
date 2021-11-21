require 'rails_helper'

RSpec.describe "raw_reviews/index", type: :view do
  before(:each) do
    assign(:raw_reviews, [
      RawReview.create!(
        landlord_public_review: "MyText",
        landlord_private_review: "MyText",
        landlord_general_rating: "",
        landlord_repairs_rating: "",
        security_deposit: "Security Deposit",
        landlord_name: "Landlord Name",
        property_manager: "Property Manager",
        submitter_ip_address: "Submitter Ip Address",
        preferred_contact: "Preferred Contact",
        rent: ""
      ),
      RawReview.create!(
        landlord_public_review: "MyText",
        landlord_private_review: "MyText",
        landlord_general_rating: "",
        landlord_repairs_rating: "",
        security_deposit: "Security Deposit",
        landlord_name: "Landlord Name",
        property_manager: "Property Manager",
        submitter_ip_address: "Submitter Ip Address",
        preferred_contact: "Preferred Contact",
        rent: ""
      )
    ])
  end

  it "renders a list of raw_reviews" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Security Deposit".to_s, count: 2
    assert_select "tr>td", text: "Landlord Name".to_s, count: 2
    assert_select "tr>td", text: "Property Manager".to_s, count: 2
    assert_select "tr>td", text: "Submitter Ip Address".to_s, count: 2
    assert_select "tr>td", text: "Preferred Contact".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
