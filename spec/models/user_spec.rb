require 'rails_helper'

RSpec.describe User, type: :model do

  it 'Should have a username attribute' do
    user = User.new(user_name: 'PictPict')
    expect(user).to have_attributes(user_name: 'PictPict')
  end

  it 'Should be valid with a username, email and password' do
    user = User.new(email: 'aaaa@aa.com', password: 'password', user_name: 'PictPict')
    expect(user).to be_valid
  end

  it 'Should be invalid valid without a username, email and password' do
    user = User.new(email: 'aaaa@aa.com', password: 'password')
    expect(user).to_not be_valid
  end

end
