require 'rails_helper'
require_relative '../support/files_test_helper.rb'

RSpec.describe Post, type: :model do
  subject { described_class.new }
  let(:post) { FactoryBot.build(:post) }
  let(:image) { FilesTestHelper.png }

  it "is valid with all required attributes" do
    subject.caption = post.caption
    subject.image = image
    expect(subject).to be_valid
  end

  it "is not valid without a caption" do
    subject.image = post.image
    expect(subject).not_to be_valid
  end

  # needs further investigation...
  xit "is not valid without image" do
    subject.caption = post.caption
    expect(subject).not_to be_valid
  end
end
