require 'rails_helper'

describe User, type: :model do
  it 'is not valid with a password of less than 6 characters' do
    user = User.new(email: "kmhicks92@gmail.com", password: "123", password_confirmation: "123")
    expect(user).to_not be_valid
  end

  it 'is not valid if password and password confirmation do not match' do
    user = User.new(email: "kmhicks92@gmail.com", password: "123456", password_confirmation: "456123")
    expect(user).to_not be_valid
  end
end
