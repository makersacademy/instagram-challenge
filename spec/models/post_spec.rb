require 'spec_helper'

describe Post, type: :model do
  it 'is not valid with a title of less than three characters' do
    image = File.new(File.expand_path('./spec/features/test.png'))
    post = Post.new(title: 'MA', image:image, tag: 'too_short')
    expect(post).to have(1).error_on(:title)
    expect(post).not_to be_valid
  end
  it "is not valid unless it has an image" do
    post = Post.new(title: 'TEST', tag: 'tagged')
    expect(post).to have(1).error_on(:image)
  end
end
