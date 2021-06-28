require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(
    first_name: "John", last_name: "Doe", email: "john@example.com", password: "example", password_confirmation: "example",
    created_at: DateTime.now, updated_at: DateTime.now) }

  describe("Valdations") do
    it("is valid with correctly given attributes") do
      expect(subject).to be_valid
    end
    
    it("is not valid without an first name") do
      subject.first_name = ""
      expect(subject).not_to be_valid  
    end

    it("is not valid without an last name") do
      subject.last_name = ""
      expect(subject).not_to be_valid  
    end

    it("is not valid without a valid email") do
      subject.email = "email+notanemail@h."
      expect(subject).not_to be_valid  
    end

    it("is not valid with a password less than 6 character") do
      subject.password = "small"
      expect(subject).not_to be_valid  
    end

    it("is not valid with a password more than 30 character") do
      subject.password = "smallsmallsmallsmallsmallsmallsmall"
      expect(subject).not_to be_valid  
    end

    it("is not valid with a duplicate email") do
      subject.save!
      new_user = User.new(
        first_name: "John", last_name: "Doe", email: "john@example.com", password: "example", password_confirmation: "example",
        created_at: DateTime.now, updated_at: DateTime.now)
      expect(new_user).not_to be_valid  
    end
  end
end
