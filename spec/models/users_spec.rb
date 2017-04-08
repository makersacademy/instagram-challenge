require 'rails_helper'

describe User, type: :model do

  before :each do
    @user = User.create(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
  end

  it 'has many likes' do
    expect(@user).to have_many :likes
  end

  it 'has many comments' do
    expect(@user).to have_many :comments
  end

  it 'has many posts' do
    expect(@user).to have_many :posts
  end

end
