require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a secure password' do
    user = User.create({ first_name: 'Sam', last_name: 'Folorunsho', email: 'sam@example.com', password_digest: '1234icecream' })
    assert_respond_to user, :password_digest
    assert_respond_to user, :authenticate, 'User requires has_secure_password'
  end
end
