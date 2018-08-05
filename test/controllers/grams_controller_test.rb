require 'test_helper'

class GramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gram = grams(:one)
  end

  test "should get index" do
    get grams_url
    assert_response :success
  end

  test "should get new" do
    get new_gram_url
    assert_response :success
  end

  test "should create gram" do
    assert_difference('Gram.count') do
      post grams_url, params: { gram: {  } }
    end

    assert_redirected_to gram_url(Gram.last)
  end

  test "should show gram" do
    get gram_url(@gram)
    assert_response :success
  end

  test "should get edit" do
    get edit_gram_url(@gram)
    assert_response :success
  end

  test "should update gram" do
    patch gram_url(@gram), params: { gram: {  } }
    assert_redirected_to gram_url(@gram)
  end

  test "should destroy gram" do
    assert_difference('Gram.count', -1) do
      delete gram_url(@gram)
    end

    assert_redirected_to grams_url
  end
end
