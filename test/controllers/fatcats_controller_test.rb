require 'test_helper'

class FatcatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fatcat = fatcats(:one)
  end

  test "should get index" do
    get fatcats_url
    assert_response :success
  end

  test "should get new" do
    get new_fatcat_url
    assert_response :success
  end

  test "should create fatcat" do
    assert_difference('Fatcat.count') do
      post fatcats_url, params: { fatcat: { caption: @fatcat.caption } }
    end

    assert_redirected_to fatcat_url(Fatcat.last)
  end

  test "should show fatcat" do
    get fatcat_url(@fatcat)
    assert_response :success
  end

  test "should get edit" do
    get edit_fatcat_url(@fatcat)
    assert_response :success
  end

  test "should update fatcat" do
    patch fatcat_url(@fatcat), params: { fatcat: { caption: @fatcat.caption } }
    assert_redirected_to fatcat_url(@fatcat)
  end

  test "should destroy fatcat" do
    assert_difference('Fatcat.count', -1) do
      delete fatcat_url(@fatcat)
    end

    assert_redirected_to fatcats_url
  end
end
