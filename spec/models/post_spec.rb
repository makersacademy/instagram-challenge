# frozen_string_literal: true

RSpec.describe Post, type: :model do
  it "is valid with valid attributes" do
    expect(Post.new).to be_valid
  end
end
