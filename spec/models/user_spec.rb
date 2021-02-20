require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: "Example User", email: "user@example.com", password: "password123", password_confirmation: "password123")
  it "should be a valid user" do
    expect(user.valid?).to be true
  end

  it "name should be present" do
    user.name = "     "
    expect(user.valid?).to be false
    user.name = "Example User"
  end

  it "email should be present" do
    user.email = "     "
    expect(user.valid?).to be false
    user.email = "user@example.com"
  end

  it "name should not be too long" do
    user.name = "a" * 51
    expect(user.valid?).to be false
    user.name = "Example User"
  end

  it "name should not be too long" do
    user.email = "a" * 244 + "@example.com"
    expect(user.valid?).to be false
    user.email = "user@example.com"
  end

  it "email addresses should be unique" do
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    user.save
    expect(duplicate_user.valid?).to be false
  end

  it "password should be present (nonblank)" do
    user.password = user.password_confirmation = " " * 6
    expect(user.valid?).to be false
    user.password = user.password_confirmation = "password123"
  end

  it "password should have a minimum length" do
    user.password = user.password_confirmation = "a" * 5
    expect(user.valid?).to be false
    user.password = user.password_confirmation = "password123"
  end
end
