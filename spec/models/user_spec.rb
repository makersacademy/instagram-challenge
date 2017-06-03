require 'rails_helper'

RSpec.describe User, type: :model do
  it "it is valid when all attributes are supplied" do
    user = User.new
    user.name = "Admin"
    user.username = "MrAdmin"
    user.email = "admin@exchangeagram.com"
    user.password = "password"
    user.save
    expect(user).to be_valid
  end

  it "it is not valid without a name" do
    user = User.new
    user.username = "MrAdmin"
    user.email = "admin@exchangeagram.com"
    user.password = "password"
    user.save
    expect(user).to_not be_valid
  end

  it "it is not valid without a username" do
    user = User.new
    user.name = "Admin"
    user.email = "admin@exchangeagram.com"
    user.password = "password"
    user.save
    expect(user).to_not be_valid
  end

  it "it is not valid without an email" do
    user = User.new
    user.name = "Admin"
    user.username = "MrAdmin"
    user.password = "password"
    user.save
    expect(user).to_not be_valid
  end

  it "it is not valid without a password" do
    user = User.new
    user.name = "Admin"
    user.username = "MrAdmin"
    user.email = "admin@exchangeagram.com"
    user.save
    expect(user).to_not be_valid
  end

end
