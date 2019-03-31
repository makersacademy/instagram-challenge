require 'test_helper'

class AddingPostControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adding_post_index_url
    assert_response :success
  end

end
