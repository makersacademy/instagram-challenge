require 'test_helper'

class TweettsControllerTest < ActionController::TestCase
  setup do
    @image = images(:one)
    @tweett = tweetts(:one)
  end

  test "should get index" do
    get :index, params: { image_id: @image }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { image_id: @image }
    assert_response :success
  end

  test "should create tweett" do
    assert_difference('Tweett.count') do
      post :create, params: { image_id: @image, tweett: @tweett.attributes }
    end

    assert_redirected_to image_tweett_path(@image, Tweett.last)
  end

  test "should show tweett" do
    get :show, params: { image_id: @image, id: @tweett }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { image_id: @image, id: @tweett }
    assert_response :success
  end

  test "should update tweett" do
    put :update, params: { image_id: @image, id: @tweett, tweett: @tweett.attributes }
    assert_redirected_to image_tweett_path(@image, Tweett.last)
  end

  test "should destroy tweett" do
    assert_difference('Tweett.count', -1) do
      delete :destroy, params: { image_id: @image, id: @tweett }
    end

    assert_redirected_to image_tweetts_path(@image)
  end
end
