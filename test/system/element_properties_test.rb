require "application_system_test_case"

class ElementPropertiesTest < ApplicationSystemTestCase
  setup do
    @element_property = element_properties(:one)
  end

  test "visiting the index" do
    visit element_properties_url
    assert_selector "h1", text: "Element Properties"
  end

  test "creating a Element property" do
    visit element_properties_url
    click_on "New Element Property"

    fill_in "Element", with: @element_property.element_id
    fill_in "Name", with: @element_property.name
    fill_in "Type", with: @element_property.type
    fill_in "Value", with: @element_property.value
    click_on "Create Element property"

    assert_text "Element property was successfully created"
    click_on "Back"
  end

  test "updating a Element property" do
    visit element_properties_url
    click_on "Edit", match: :first

    fill_in "Element", with: @element_property.element_id
    fill_in "Name", with: @element_property.name
    fill_in "Type", with: @element_property.type
    fill_in "Value", with: @element_property.value
    click_on "Update Element property"

    assert_text "Element property was successfully updated"
    click_on "Back"
  end

  test "destroying a Element property" do
    visit element_properties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Element property was successfully destroyed"
  end
end
