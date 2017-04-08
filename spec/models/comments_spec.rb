require 'rails_helper'

describe Comment, type: :model do

  before :each do
    @post = Post.create(image:File.new('/Users/ashwinimani/Pictures/indian_food.jpg'), description: 'delicious')
    @comment = Comment.create(opinions: 'wow', post_id: @post.id)
  end

  it 'belongs to post' do
    expect(@comment).to belong_to :post
  end

  it 'belongs to user' do
    expect(@comment).to belong_to :user
  end

end
