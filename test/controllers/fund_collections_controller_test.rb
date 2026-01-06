require "test_helper"

class FundCollectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fund_collections_index_url
    assert_response :success
  end

  test "should get new" do
    get fund_collections_new_url
    assert_response :success
  end

  test "should get create" do
    get fund_collections_create_url
    assert_response :success
  end
end
