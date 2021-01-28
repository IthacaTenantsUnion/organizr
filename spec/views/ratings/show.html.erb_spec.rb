require 'rails_helper'

RSpec.describe "ratings/show", type: :view do
  before(:each) do
    @rating = assign(:rating, Rating.create!(
      user: nil,
      landlord: nil,
      overall: 2,
      repairs: 3,
      review: "Review"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Review/)
  end
end
