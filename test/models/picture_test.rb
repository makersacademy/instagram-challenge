require 'test_helper'

class PictureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'picture must have a title' do
    picture = Picture.new
    assert_not picture.save
  end
  test 'picture must have descriptive text' do
    picture = Picture.new
    picture.title = 'fake title'
    assert_not picture.save
  end
  test 'picture with title and descriptive text will save' do
    picture = Picture.new
    picture.title = 'fake title'
    picture.text = 'fake description'
    assert picture.save
  end
end
