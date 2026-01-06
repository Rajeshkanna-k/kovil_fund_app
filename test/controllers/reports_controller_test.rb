require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get kalvettu" do
    get reports_kalvettu_url
    assert_response :success
  end
end
