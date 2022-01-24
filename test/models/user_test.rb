require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user with a missing field" do
    user = User.new
    assert_not user.save
  end
end
