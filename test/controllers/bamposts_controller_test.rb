require "test_helper"

class BampostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bampost = bamposts(:one)
  end

  test "should get index" do
    get bamposts_url
    assert_response :success
  end

  test "should get new" do
    get new_bampost_url
    assert_response :success
  end

  test "should create bampost" do
    assert_difference('Bampost.count') do
      post bamposts_url, params: { bampost: { content: @bampost.content, user_id: @bampost.user_id } }
    end

    assert_redirected_to bampost_url(Bampost.last)
  end

  test "should show bampost" do
    get bampost_url(@bampost)
    assert_response :success
  end

  test "should get edit" do
    get edit_bampost_url(@bampost)
    assert_response :success
  end

  test "should update bampost" do
    patch bampost_url(@bampost), params: { bampost: { content: @bampost.content, user_id: @bampost.user_id } }
    assert_redirected_to bampost_url(@bampost)
  end

  test "should destroy bampost" do
    assert_difference('Bampost.count', -1) do
      delete bampost_url(@bampost)
    end

    assert_redirected_to bamposts_url
  end
end
