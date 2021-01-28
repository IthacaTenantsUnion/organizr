require 'rails_helper'

RSpec.describe "ratings/new", type: :view do
  before(:each) do
    assign(:rating, Rating.new(
      user: nil,
      landlord: nil,
      overall: 1,
      repairs: 1,
      review: "MyString"
    ))
  end

  it "renders new rating form" do
    render

    assert_select "form[action=?][method=?]", ratings_path, "post" do

      assert_select "input[name=?]", "rating[user_id]"

      assert_select "input[name=?]", "rating[landlord_id]"

      assert_select "input[name=?]", "rating[overall]"

      assert_select "input[name=?]", "rating[repairs]"

      assert_select "input[name=?]", "rating[review]"
    end
  end
end
