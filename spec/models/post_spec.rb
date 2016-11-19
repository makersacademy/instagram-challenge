require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'should accept a post with a caption' do
    post = Post.create(caption: 'Fluffy kittens!')
    expect(post.caption).to eq 'Fluffy kittens!'
  end 
end
