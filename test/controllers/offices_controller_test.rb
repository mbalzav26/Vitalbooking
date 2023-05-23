require "test_helper"

class OfficesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get offices_index_url
    assert_response :success
  end

  test "should get new" do
    get offices_new_url
    assert_response :success
  end

  test "should get edit" do
    get offices_edit_url
    assert_response :success
  end
end
