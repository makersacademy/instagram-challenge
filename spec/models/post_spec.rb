require 'rails_helper'

describe Post, type: :model do
  it 'a caption is not valid with more than 140 chars' do
    long_caption = Post.new(caption: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et mag.')
    expect(long_caption).to have(1).error_on(:caption)
    expect(long_caption).not_to be_valid
  end
end
