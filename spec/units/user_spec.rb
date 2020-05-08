require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { described_class.new name: "Example User", email: "user@example.com",
                                    password: "password123", password_confirmation: "password123" }

  it "should be valid" do
    expect(user).to be_valid
  end

  it "name should be present" do
    user.name = "  "
    expect(user).to_not be_valid
  end

  it "email should be present" do
    user.email = "  "
    expect(user).to_not be_valid
  end

  it "name should not be too long" do
    user.name = "a" * 51
    expect(user).to_not be_valid
  end

  it "email should not be too long" do
    user.email = "a" * 244 + "@example.com"
    expect(user).to_not be_valid
  end

  it "email validation should accept valid addresses" do
    valid_addresses = ["user@example.com", "USER@foo.COM", "A_US-ER@foo.bar.org", "first.last@foo.jp", "alice+bob@baz.cn"]

    valid_addresses.each do |valid_adress|
      user.email = valid_adress
      expect(user).to be_valid
    end
  end

  it "email validation should reject invalid addresses" do
    invalid_addresses = ["user@example,com", "user_at_foo.org", "user.name@example.", "foo@bar_baz.com", "foo@bar+baz.com"]

    invalid_addresses.each do |invalid_adress|
      user.email = invalid_adress
      expect(user).not_to be_valid
    end
  end

  it "email addresses should be unique" do
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    user.save
    expect(duplicate_user).to_not be_valid
  end

  it "password should be present (nonblank)" do
    user.password, user.password_confirmation = "  "
    expect(user).to_not be_valid
  end

  it "password should have a minimum length" do
    user.password, user.password_confirmation = "a" * 5
    expect(user).to_not be_valid
  end

end
