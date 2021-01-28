require 'rails_helper'

RSpec.describe "landlords/index", type: :view do
  before(:each) do
    assign(:landlords, [
      Landlord.create!(
        name: "Name"
      ),
      Landlord.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of landlords" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
