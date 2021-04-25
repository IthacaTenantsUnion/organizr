require "rails_helper"

RSpec.describe "Signups", :type => :system do
  it "allows a user to provide a rating" do
    visit root_path
    fill_in "Name", with: "Some Guy"
    fill_in "Email", with: "some@email.com"
    fill_in "Phone", with: "607-555-1234"


    fill_in "landlord_autocomplete", with: "John Q. Landlord"
    fill_in "unit_autocomplete", with: "123 Broad St, apt 6"

    all("label i.fa-meh").each do |rating|
      rating.click
    end

    fill_in "Public:", with: "A Public review"
    fill_in "Private:", with: "A Private review"

    fill_in "What is your average monthly income?", with: "1000"
    fill_in "How much does your unit’s rent cost?", with: "1200"
    fill_in "How many rent-paying people live in your unit?", with: "2"

    click_on "Submit Review"

    save_and_open_screenshot
  end

  it "allows a user to also sign up" do
  end
end