require "application_system_test_case"

class AirlinesTest < ApplicationSystemTestCase
  setup do
    @airline = airlines(:one)
  end

  test "visiting the index" do
    visit airlines_url
    assert_selector "h1", text: "Airlines"
  end

  test "should create airline" do
    visit airlines_url
    click_on "New airline"

    fill_in "Image url", with: @airline.image_url
    fill_in "Name", with: @airline.name
    fill_in "Slug", with: @airline.slug
    click_on "Create Airline"

    assert_text "Airline was successfully created"
    click_on "Back"
  end

  test "should update Airline" do
    visit airline_url(@airline)
    click_on "Edit this airline", match: :first

    fill_in "Image url", with: @airline.image_url
    fill_in "Name", with: @airline.name
    fill_in "Slug", with: @airline.slug
    click_on "Update Airline"

    assert_text "Airline was successfully updated"
    click_on "Back"
  end

  test "should destroy Airline" do
    visit airline_url(@airline)
    click_on "Destroy this airline", match: :first

    assert_text "Airline was successfully destroyed"
  end
end
