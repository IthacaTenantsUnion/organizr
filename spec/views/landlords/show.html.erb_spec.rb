require 'rails_helper'

RSpec.describe "landlords/show", type: :view do
  before(:each) do
    @landlord = assign(:landlord, Landlord.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
