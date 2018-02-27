require 'test_helper'

class SubmissionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get submission_new_url
    assert_response :success
  end

  test "should get create" do
    get submission_create_url
    assert_response :success
  end

  test "should get destroy" do
    get submission_destroy_url
    assert_response :success
  end

  test "should get delete" do
    get submission_delete_url
    assert_response :success
  end

end
