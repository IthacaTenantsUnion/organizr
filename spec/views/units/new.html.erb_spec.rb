require 'rails_helper'

RSpec.describe "units/new", type: :view do
  before(:each) do
    assign(:unit, Unit.new(
      address: "MyString",
      landlord: nil
    ))
  end

  it "renders new unit form" do
    render

    assert_select "form[action=?][method=?]", units_path, "post" do

      assert_select "input[name=?]", "unit[address]"

      assert_select "input[name=?]", "unit[landlord_id]"
    end
  end
end
