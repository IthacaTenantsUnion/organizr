require 'rails_helper'

RSpec.describe "units/edit", type: :view do
  before(:each) do
    @unit = assign(:unit, Unit.create!(
      address: "MyString",
      landlord: nil
    ))
  end

  it "renders the edit unit form" do
    render

    assert_select "form[action=?][method=?]", unit_path(@unit), "post" do

      assert_select "input[name=?]", "unit[address]"

      assert_select "input[name=?]", "unit[landlord_id]"
    end
  end
end
