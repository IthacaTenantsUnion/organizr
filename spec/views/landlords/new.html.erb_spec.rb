require 'rails_helper'

RSpec.describe "landlords/new", type: :view do
  before(:each) do
    assign(:landlord, Landlord.new(
      name: "MyString"
    ))
  end

  it "renders new landlord form" do
    render

    assert_select "form[action=?][method=?]", landlords_path, "post" do

      assert_select "input[name=?]", "landlord[name]"
    end
  end
end
