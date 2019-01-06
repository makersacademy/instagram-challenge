require 'rails_helper'
require_relative '../support/files_test_helper.rb'

RSpec.describe Post, type: :model do
  subject     { described_class.new }
  let(:post)  { FactoryBot.build(:post) }
  let(:image) { FilesTestHelper.png }
  let(:user)  { FactoryBot.build(:user) }

  it "has belongs to user" do
    post = described_class.reflect_on_association(:user)
    expect(post.macro).to eq :belongs_to
  end

  it "has many likes" do
    post = described_class.reflect_on_association(:likes)
    expect(post.macro).to eq :has_many
  end

  it "is valid with all required attributes" do
    subject.caption = post.caption
    subject.image = image
    subject.user = user
    expect(subject).to be_valid
  end

  it "is not valid without a user" do
    subject.caption = post.caption
    subject.image = image
    expect(subject).not_to be_valid
  end

  it "is not valid without a caption" do
    subject.user = user
    subject.image = image
    expect(subject).not_to be_valid
  end

  it "is not valid without image" do
    subject.user = user
    subject.caption = post.caption
    expect(subject).not_to be_valid
  end
end
