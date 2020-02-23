require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    User.create({ first_name: 'Sam', last_name: 'Folorunsho', email: 'sam@example.com', password: '1234icecream' })
  end

  it 'has a secure password' do
    user = User.find_by({ email: 'sam@example.com' })
    assert_respond_to user, :password_digest
    assert_respond_to user, :authenticate, 'User requires has_secure_password'
  end

  it 'has a valid email' do
    user = User.create({ first_name: 'Sam', last_name: 'Folorunsho', email: 'sam@@xample...com', password: '1234icecream' })
    expect(user).not_to be_valid
  end

  it 'has a unique email' do
    other_user = User.create({ first_name: 'Other Sam', last_name: 'Folorunsho', email: 'sam@example.com', password: '1234alsoicecream' })
    expect(other_user).not_to be_valid
  end
end
