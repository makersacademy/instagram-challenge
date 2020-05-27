require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { described_class.new(
      id: 1,
      name: 'fakeuser',
      email: 'fake@fakeemail.com',
      encrypted_password: 'fakepassword'
    )
  }

  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user.encrypted_password = nil
    expect(user).to_not be_valid
  end

end
