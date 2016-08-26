require 'rails_helper'

RSpec.describe User, type: :model do

  it 'allows to pass in username when creating a user' do
    user = User.create(email: 'test@test.com', password: 'password', username: 'arukomp')
    expect(user.username).to eq 'arukomp'
  end

  it 'username is required' do
    user = User.create(email: 'test@test.com', password: 'password')
    expect(user).to have(1).error_on(:username)
  end

end
