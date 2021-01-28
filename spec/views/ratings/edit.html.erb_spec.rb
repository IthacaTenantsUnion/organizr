require 'rails_helper'

RSpec.describe "ratings/edit", type: :view do
  before(:each) do
    @rating = assign(:rating, Rating.create!(
      user: nil,
      landlord: nil,
      overall: 1,
      repairs: 1,
      review: "MyString"
    ))
  end

  it "renders the edit rating form" do
    render

    assert_select "form[action=?][method=?]", rating_path(@rating), "post" do

      assert_select "input[name=?]", "rating[user_id]"

      assert_select "input[name=?]", "rating[landlord_id]"

      assert_select "input[name=?]", "rating[overall]"

      assert_select "input[name=?]", "rating[repairs]"

      assert_select "input[name=?]", "rating[review]"
    end
  end
end
