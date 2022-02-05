require "test_helper"

class ElementPropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @element_property = element_properties(:one)
  end

  test "should get index" do
    get element_properties_url
    assert_response :success
  end

  test "should get new" do
    get new_element_property_url
    assert_response :success
  end

  test "should create element_property" do
    assert_difference('ElementProperty.count') do
      post element_properties_url, params: { element_property: { element_id: @element_property.element_id, name: @element_property.name, type: @element_property.type, value: @element_property.value } }
    end

    assert_redirected_to element_property_url(ElementProperty.last)
  end

  test "should show element_property" do
    get element_property_url(@element_property)
    assert_response :success
  end

  test "should get edit" do
    get edit_element_property_url(@element_property)
    assert_response :success
  end

  test "should update element_property" do
    patch element_property_url(@element_property), params: { element_property: { element_id: @element_property.element_id, name: @element_property.name, type: @element_property.type, value: @element_property.value } }
    assert_redirected_to element_property_url(@element_property)
  end

  test "should destroy element_property" do
    assert_difference('ElementProperty.count', -1) do
      delete element_property_url(@element_property)
    end

    assert_redirected_to element_properties_url
  end
end
