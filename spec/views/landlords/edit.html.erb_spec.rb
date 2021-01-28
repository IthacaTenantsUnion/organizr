require 'rails_helper'

RSpec.describe "landlords/edit", type: :view do
  before(:each) do
    @landlord = assign(:landlord, Landlord.create!(
      name: "MyString"
    ))
  end

  it "renders the edit landlord form" do
    render

    assert_select "form[action=?][method=?]", landlord_path(@landlord), "post" do

      assert_select "input[name=?]", "landlord[name]"
    end
  end
end
