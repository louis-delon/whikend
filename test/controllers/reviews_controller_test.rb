require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get content" do
    get reviews_content_url
    assert_response :success
  end

  test "should get rating" do
    get reviews_rating_url
    assert_response :success
  end

end
