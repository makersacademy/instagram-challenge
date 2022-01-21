require 'rails_helper'

RSpec.describe User, :type => :model do

  it "is valid with valid attributes" do
    user = User.new(name: "Kim", email: "kim@gmail.com", username: "kim_morgan", password: "password", password_confirmation: "password")
    expect(user.valid?).to be true
  end

  it "is not valid without a username" do
    user = User.new(name: "Kim", email: "kim@gmail.com", password: "password", password_confirmation: "password")
    expect(user.valid?).to be false
  end

  it "is not valid without a name" do
    user = User.new(email: "kim@gmail.com", username: "kim_morgan", password: "password", password_confirmation: "password")
    expect(user.valid?).to be false
  end

  it "is not valid without an email" do
    user = User.new(name: "Kim", username: "kim_morgan", password: "password", password_confirmation: "password")
    expect(user.valid?).to be false
  end

  it "is not valid with a nonsense email" do
    user = User.new(name: "Kim", email: "aaaa", username: "kim_morgan", password: "password", password_confirmation: "password")
    expect(user.valid?).to be false
  end

  it "name should not be too long" do
    user = User.new(name: "a" * 51, email: "kim@gmail.com", username: "kim_morgan", password: "password", password_confirmation: "password")
    expect(user.valid?).to be false
  end

  it "email should not be too long" do
    user = User.new(name: "aa", email: "a" * 256, username: "kim_morgan", password: "password", password_confirmation: "password")
    expect(user.valid?).to be false
  end

  it "email addresses should be unique and case insensitive" do
    user = User.new(name: "Kim", email: "kim@gmail.com", username: "kim_morgan", password: "password", password_confirmation: "password")
    user.save
    user_2 = user.dup
    user_2.email = user.email.upcase
    expect(user_2.valid?).to be false
  end

  it "usernames should be unique and case insensitive" do
    user = User.new(name: "Kim", email: "kim@gmail.com", username: "kim_morgan", password: "password", password_confirmation: "password")
    user.save
    user_2 = user.dup
    user_2.username = user.username.upcase
    expect(user_2.valid?).to be false
  end

  it "usernames are saved lower case" do
    user = User.new(name: "Kim", email: "kim@gmail.com", username: "KiM_MoRgAn", password: "password", password_confirmation: "password")
    user.save
    expect(user.username).to eq "kim_morgan"
  end

  it "emails are saved lower case" do
    user = User.new(name: "Kim", email: "kIm@gmAil.com", username: "KiMMM_MoRgAn", password: "password", password_confirmation: "password")
    user.save
    expect(user.email).to eq "kim@gmail.com"
  end

end