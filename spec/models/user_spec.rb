# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }
  let(:user) { FactoryBot.build(:user) }

  it "has many posts" do
    user = described_class.reflect_on_association(:posts)
    expect(user.macro).to eq :has_many
  end

  it "has many likes" do
    user = described_class.reflect_on_association(:likes)
    expect(user.macro).to eq :has_many
  end

  it "is valid with all required attributes" do
    subject.first_name = user.first_name
    subject.last_name = user.last_name
    subject.username = user.username
    subject.email = user.email
    subject.password = user.password
    expect(subject).to be_valid
  end

  it "is not valid without a first name" do
    subject.last_name = user.last_name
    subject.username = user.username
    subject.email = user.email
    subject.password = user.password
    expect(subject).not_to be_valid
  end

  it "is not valid without a last name" do
    subject.first_name = user.first_name
    subject.username = user.username
    subject.email = user.email
    subject.password = user.password
    expect(subject).not_to be_valid
  end

  it "is not valid without a username" do
    subject.first_name = user.first_name
    subject.last_name = user.last_name
    subject.email = user.email
    subject.password = user.password
    expect(subject).not_to be_valid
  end

  it "is not valid without email" do
    subject.first_name = user.first_name
    subject.last_name = user.last_name
    subject.username = user.username
    subject.password = user.password
    expect(subject).not_to be_valid
  end

  it "is not valid without password" do
    subject.first_name = user.first_name
    subject.last_name = user.last_name
    subject.username = user.username
    subject.email = user.email
    expect(subject).not_to be_valid
  end
end
