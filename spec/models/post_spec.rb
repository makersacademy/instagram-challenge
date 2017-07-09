require 'rails_helper'

RSpec.describe Post, type: :model do

  post = Post.create(caption: 'Lorem Ipsum', image: 'img.jpeg')

  it 'should have a caption' do
    expect(post.caption).to eq('Lorem Ipsum')
  end

end
