require 'rails_helper'

RSpec.describe "raw_reviews/show", type: :view do
  before(:each) do
    @raw_review = assign(:raw_review, RawReview.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Security Deposit/)
    expect(rendered).to match(/Landlord Name/)
    expect(rendered).to match(/Property Manager/)
    expect(rendered).to match(/Submitter Ip Address/)
    expect(rendered).to match(/Preferred Contact/)
    expect(rendered).to match(//)
  end
end
