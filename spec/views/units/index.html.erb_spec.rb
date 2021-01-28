require 'rails_helper'

RSpec.describe "units/index", type: :view do
  before(:each) do
    assign(:units, [
      Unit.create!(
        address: "Address",
        landlord: nil
      ),
      Unit.create!(
        address: "Address",
        landlord: nil
      )
    ])
  end

  it "renders a list of units" do
    render
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
