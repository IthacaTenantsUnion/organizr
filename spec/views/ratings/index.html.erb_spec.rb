require 'rails_helper'

RSpec.describe "ratings/index", type: :view do
  before(:each) do
    assign(:ratings, [
      Rating.create!(
        user: nil,
        landlord: nil,
        overall: 2,
        repairs: 3,
        review: "Review"
      ),
      Rating.create!(
        user: nil,
        landlord: nil,
        overall: 2,
        repairs: 3,
        review: "Review"
      )
    ])
  end

  it "renders a list of ratings" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Review".to_s, count: 2
  end
end
