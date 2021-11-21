require 'rails_helper'

RSpec.describe "raw_reviews/new", type: :view do
  before(:each) do
    assign(:raw_review, RawReview.new(
      landlord_public_review: "MyText",
      landlord_private_review: "MyText",
      landlord_general_rating: "",
      landlord_repairs_rating: "",
      security_deposit: "MyString",
      landlord_name: "MyString",
      property_manager: "MyString",
      submitter_ip_address: "MyString",
      preferred_contact: "MyString",
      rent: ""
    ))
  end

  it "renders new raw_review form" do
    render

    assert_select "form[action=?][method=?]", raw_reviews_path, "post" do

      assert_select "textarea[name=?]", "raw_review[landlord_public_review]"

      assert_select "textarea[name=?]", "raw_review[landlord_private_review]"

      assert_select "input[name=?]", "raw_review[landlord_general_rating]"

      assert_select "input[name=?]", "raw_review[landlord_repairs_rating]"

      assert_select "input[name=?]", "raw_review[security_deposit]"

      assert_select "input[name=?]", "raw_review[landlord_name]"

      assert_select "input[name=?]", "raw_review[property_manager]"

      assert_select "input[name=?]", "raw_review[submitter_ip_address]"

      assert_select "input[name=?]", "raw_review[preferred_contact]"

      assert_select "input[name=?]", "raw_review[rent]"
    end
  end
end
