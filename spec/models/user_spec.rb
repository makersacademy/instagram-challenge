require 'rails_helper'

describe User do
  before do
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  it "should be valid" do
    expect(@user).to be_valid
  end

  it "needs a name to be valid" do
    @user.name = " "
    expect(@user).not_to be_valid
  end

  it "needs an email to be valid" do
    @user.email = " "
    expect(@user).not_to be_valid
  end

  it "name should not be too long" do
   @user.name = "a" * 31
   expect(@user).not_to be_valid
 end

  it "email should not be too long" do
    @user.email = "a" * 101
    expect(@user).not_to be_valid
  end

  it "should accept valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
  end

  it "rejects invalid email addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).not_to be_valid
    end
  end

  it "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user).not_to be_valid
  end

  it "email addresses should be unique, even if cases are different" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    expect(@user.reload.email).to eq(mixed_case_email.downcase)
  end

  it "password can't be blank" do
    @user.password = @user.password_confirmation = " " * 6
    expect(@user).not_to be_valid
  end

  it "password can't be less than 6 characters" do
    @user.password = @user.password_confirmation = "a" * 5
    expect(@user).not_to be_valid
  end

end
