require 'rails_helper'

RSpec.describe User, :type => :model do

  it "is valid with valid attributes" do
    user = User.new(name: "Kim", email: "kim@gmail.com", username: "kim_morgan")
    expect(user.valid?).to be true
  end

  it "is not valid without a username" do
    user = User.new(name: "Kim", email: "kim@gmail.com")
    expect(user.valid?).to be false
  end

  it "is not valid without a name" do
    user = User.new(email: "kim@gmail.com", username: "kim_morgan")
    expect(user.valid?).to be false
  end

  it "is not valid without an email" do
    user = User.new(name: "Kim", username: "kim_morgan")
    expect(user.valid?).to be false
  end

  it "is not valid with a nonsense email" do
    user = User.new(name: "Kim", email: "aaaa", username: "kim_morgan")
    expect(user.valid?).to be false
  end

  it "name should not be too long" do
    user = User.new(name: "a" * 51, email: "kim@gmail.com", username: "kim_morgan")
    expect(user.valid?).to be false
  end

  it "email should not be too long" do
    user = User.new(name: "aa", email: "a" * 256, username: "kim_morgan")
    expect(user.valid?).to be false
  end

end