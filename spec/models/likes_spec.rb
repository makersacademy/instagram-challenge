require 'rails_helper'

describe Like, type: :model do

  before :each do
    # @user = User.create(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
    @post = Post.create(image:File.new('spec/helpers/indian_food.jpg'), description: 'delicious')
    @like = Like.create(post_id: @post.id)#, user_id: @user.id)
  end

  it 'belongs to post' do
    expect(@like).to belong_to :post
  end

  it 'belongs to user' do
    expect(@like).to belong_to :user
  end

end
