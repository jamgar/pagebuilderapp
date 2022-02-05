require "application_system_test_case"

class PageElementsTest < ApplicationSystemTestCase
  setup do
    @page_element = page_elements(:one)
  end

  test "visiting the index" do
    visit page_elements_url
    assert_selector "h1", text: "Page Elements"
  end

  test "creating a Page element" do
    visit page_elements_url
    click_on "New Page Element"

    fill_in "Element", with: @page_element.element_id
    fill_in "Page", with: @page_element.page_id
    fill_in "Properties", with: @page_element.properties
    click_on "Create Page element"

    assert_text "Page element was successfully created"
    click_on "Back"
  end

  test "updating a Page element" do
    visit page_elements_url
    click_on "Edit", match: :first

    fill_in "Element", with: @page_element.element_id
    fill_in "Page", with: @page_element.page_id
    fill_in "Properties", with: @page_element.properties
    click_on "Update Page element"

    assert_text "Page element was successfully updated"
    click_on "Back"
  end

  test "destroying a Page element" do
    visit page_elements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Page element was successfully destroyed"
  end
end
