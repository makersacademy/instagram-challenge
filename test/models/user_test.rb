require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test 'creating a user requires a handle' do 
    user = User.new
    user.email = 'email@example.com'
    user.password_digest = 'password'
    assert_raises do
      user.save
    end
  end
end
