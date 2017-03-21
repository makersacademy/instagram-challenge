require 'rails_helper'

describe User, type: :model do

  it 'should have an email' do
    @user = User.create(email: "khicks@test.com", password: "123456", password_confirmation: "123456")
    expect(@user.email).to eq("khicks@test.com")
  end

  it 'should have a password' do
    @user = User.create(email: "khicks@test.com", password: "123456", password_confirmation: "123456")
    expect(@user.password).to eq("123456")
  end

  it 'should have many posts' do
    should have_many :posts
  end

  it 'is not valid with a password of less than 6 characters' do
    @user = User.create(email: "khicks@test.com", password: "123", password_confirmation: "123")
    expect(@user).to_not be_valid
  end

  it 'is not valid if password and password confirmation do not match' do
    @user = User.create(email: "khicks@test.com", password: "123456", password_confirmation: "456123")
    expect(@user).to_not be_valid
  end
  
end
