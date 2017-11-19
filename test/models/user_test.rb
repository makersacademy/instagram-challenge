require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'users must create an account if they want to see photos' do
    user = User.create(name: 'Chayya', email: 'chayya@chayya.com')
  end

  # test "the truth" do
  #   assert true
  # end
end
