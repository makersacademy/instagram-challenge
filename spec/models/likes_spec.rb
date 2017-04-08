require 'rails_helper'

describe Like, type: :model do

  before :each do
    @post = Post.create(image:File.new('/Users/ashwinimani/Pictures/indian_food.jpg'), description: 'delicious')
    @like = Like.create(post_id: @post.id)
  end

  it 'belongs to post' do
    expect(@like).to belong_to :post
  end

  # it 'belongs to user' do
  #   expect(@like).to belong_to :user
  # end

end
