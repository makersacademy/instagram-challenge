require "rails_helper"

RSpec.describe User, type: :model do

  let(:user) do
    User.new( name: "Elvis",
              email: "elvis@gmail.com",
              password: "blue_hawaii",
              password_confirmation: "blue_hawaii")
  end
  let(:user_2) { user.dup }
  let(:invalid_addresses) { %w[s@gmail..com user@gmail DR_@ user,@gmail,com user@gmail,com]}

  context "setup" do
    it "the setup user is valid" do
      expect(user.valid?).to eq true
    end
  end

  context "validating user name" do
    it "must be included" do
      user.name = ""
      expect(user.valid?).to eq false
    end

    it "has a maximum of 50 characters" do
      user.name = "a" * 51
      expect(user.valid?).to eq false
    end
  end

  context "validating user email" do
    it "must be included" do
      user.email = ""
      expect(user.valid?).to eq false
    end

    it "can't exceed the max length of strings" do
      user.name = "a" * 256
      expect(user.valid?).to eq false
    end

    it "can't have an invalid email format" do
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user.valid?).to eq(false), "#{invalid_address.inspect} should be invalid"
      end
    end

    it "must be unique" do
      user_2.email = user.email.upcase
      user.save
      expect(user_2.valid?).to eq false
    end

    it "is stored in lowercase" do
      user.email = user.email.upcase
      user.save
      expect(user.email).to eq "elvis@gmail.com"
    end
  end

  context "validating password" do
    it "cant' be blanck" do
      user.password = user.password_confirmation = " " * 6
      expect(user.valid?).to eq false
    end

    it "has a minimum length of 6 characters" do
      user.password = user.password_confirmation = "i" * 4
      expect(user.valid?).to eq false
    end
  end
end
