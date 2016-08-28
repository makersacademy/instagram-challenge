require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is not vaild without a caption' do
    post = Post.new(caption: "")
    expect(post).to have(1).error_on(:caption)
    expect(post).not_to be_valid
  end
end
