require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  it "is valid with all required attributes" do
    subject.id = 1
    subject.first_name = "Chris"
    subject.last_name = "Gilbert"
    subject.username = "instachris"
    subject.email = "email@email.com"
    subject.password = "password"
    subject.created_at = Time.now
    subject.updated_at = Time.now
    expect(subject).to be_valid
  end

  it "is not valid without a first name" do
    subject.id = 1
    subject.last_name = "Gilbert"
    subject.username = "instachris"
    subject.email = "email@email.com"
    subject.password = "password"
    subject.created_at = Time.now
    subject.updated_at = Time.now
    expect(subject).not_to be_valid
  end

  it "is not valid without a last name" do
    subject.id = 1
    subject.first_name = "Chris"
    subject.username = "instachris"
    subject.email = "email@email.com"
    subject.password = "password"
    subject.created_at = Time.now
    subject.updated_at = Time.now
    expect(subject).not_to be_valid
  end

  it "is not valid without a username" do
    subject.id = 1
    subject.first_name = "Chris"
    subject.last_name = "Gilbert"
    subject.email = "email@email.com"
    subject.password = "password"
    subject.created_at = Time.now
    subject.updated_at = Time.now
    expect(subject).not_to be_valid
  end

  it "is not valid without email" do
    subject.id = 1
    subject.first_name = "Chris"
    subject.last_name = "Gilbert"
    subject.username = "instachris"
    subject.password = "password"
    subject.created_at = Time.now
    subject.updated_at = Time.now
    expect(subject).not_to be_valid
  end

  it "is not valid without password" do
    subject.id = 1
    subject.first_name = "Chris"
    subject.last_name = "Gilbert"
    subject.username = "instachris"
    subject.email = "email@email.com"
    subject.created_at = Time.now
    subject.updated_at = Time.now
    expect(subject).not_to be_valid
  end
end
