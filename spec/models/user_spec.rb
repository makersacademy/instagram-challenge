require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be }

  it 'Can create a new user' do
    user = User.create(name: 'Jade', email: 'jade@jade.com', password: '123456')
    expect(user).to be_valid
  end

  it 'Cannot create users with the same name' do
    user = User.create(name: 'Jade', email: 'jade@jade.com', password: '123456')
    user2 = User.create(name: 'Jade', email: 'jade2@jade2.com', password: '123456')
    expect(user2).not_to be_valid
  end

  it 'Cannot create users with the same email' do
    user = User.create(name: 'Jade', email: 'jade@jade.com', password: '123456')
    user2 = User.create(name: 'Jade2', email: 'jade@jade.com', password: '123456')
    expect(user2).not_to be_valid
  end

  it 'Cannot create a user with no password' do
    user = User.create(name: 'Jade', email: 'jade@jade.com')
    expect(user).not_to be_valid
  end
end
