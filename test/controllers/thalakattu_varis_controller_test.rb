require "test_helper"

class ThalakattuVarisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get thalakattu_varis_index_url
    assert_response :success
  end

  test "should get new" do
    get thalakattu_varis_new_url
    assert_response :success
  end

  test "should get create" do
    get thalakattu_varis_create_url
    assert_response :success
  end
end
