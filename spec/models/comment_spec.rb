# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.new(first_name: "John", last_name: "Snow", email: "test@emai.com", password: "123456")

    # @user = instance_double('User', id: 1, first_name: "John", last_name: "Snow", email: "test@emai.com", password: "123456")

    file = fixture_file_upload(Rails.root.join('public', 'download.png'), 'image/png')
    @post = Post.new(image: file)
    # @post = instance_double('Post', image: file, id: 1)
  end

  subject { described_class.new(body: "Text", post_id: @post.id, user_id: @user.id) }

  it "is valid with valid attributes" do
    comment = Comment.new(body: "Text", post_id: @post.id, user_id: @user.id)

    # expect(subject).to be_valid
  end

  it "is not valid without a body" do
    subject.body = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a user logged in" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a post" do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end
end
