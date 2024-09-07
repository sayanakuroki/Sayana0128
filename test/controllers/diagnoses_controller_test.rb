require "test_helper"

class DiagnosesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get diagnoses_new_url
    assert_response :success
  end

  test "should get create" do
    get diagnoses_create_url
    assert_response :success
  end

  test "should get result" do
    get diagnoses_result_url
    assert_response :success
  end
end