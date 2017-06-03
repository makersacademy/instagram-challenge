require 'rails_helper'

RSpec.describe User, type: :model do

  it "valid with all attributes" do
    user = User.new
    user.username = "Test Name"
    user.email = "test@test.com"
    user.password = "password"
    user.save
    expect(user).to be_valid
  end

  it "not valid without username" do
    user = User.new
    user.email = "test@test.com"
    user.password = "password"
    user.save
    expect(user).to_not be_valid
  end

  it "not valid without email" do
    user = User.new
    user.username = "Test Name"
    user.password = "password"
    user.save
    expect(user).to_not be_valid
  end

  it "not valid without password" do
    user = User.new
    user.username = "Test Name"
    user.email = "test@test.com"
    user.save
    expect(user).to_not be_valid
  end
end
