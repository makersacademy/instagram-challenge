require 'rails_helper'

RSpec.describe User, type: :model do

  subject {described_class.new(first_name: "john", last_name: "snow", email: 'test@test.com', password: "password", password_confirmation: "password")}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a first name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a last name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  # How to test accepting picture as an avatar? Picture not in the model
end
