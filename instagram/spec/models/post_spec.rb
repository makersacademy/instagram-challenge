require "rails_helper"

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it 'has a title' do
    post = Post.new(title: "")
    expect(post).to_not be_valid
    post.title = "This is a message"
    expect(post).to be_valid
  end
end
