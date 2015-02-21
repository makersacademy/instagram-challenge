require 'spec_helper'

describe Post, type: :model do
  it 'is not valid with a description less than two characters' do
    post = Post.new(description: 'X')
    expect(post).to have(1).error_on(:description)
    expect(post).not_to be_valid
  end
end