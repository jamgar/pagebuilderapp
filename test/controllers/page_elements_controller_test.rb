require "test_helper"

class PageElementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page_element = page_elements(:one)
  end

  test "should get index" do
    get page_elements_url
    assert_response :success
  end

  test "should get new" do
    get new_page_element_url
    assert_response :success
  end

  test "should create page_element" do
    assert_difference('PageElement.count') do
      post page_elements_url, params: { page_element: { element_id: @page_element.element_id, page_id: @page_element.page_id, properties: @page_element.properties } }
    end

    assert_redirected_to page_element_url(PageElement.last)
  end

  test "should show page_element" do
    get page_element_url(@page_element)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_element_url(@page_element)
    assert_response :success
  end

  test "should update page_element" do
    patch page_element_url(@page_element), params: { page_element: { element_id: @page_element.element_id, page_id: @page_element.page_id, properties: @page_element.properties } }
    assert_redirected_to page_element_url(@page_element)
  end

  test "should destroy page_element" do
    assert_difference('PageElement.count', -1) do
      delete page_element_url(@page_element)
    end

    assert_redirected_to page_elements_url
  end
end
