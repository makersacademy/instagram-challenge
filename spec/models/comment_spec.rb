require 'rails_helper'
require 'timecop'

describe Comment, type: :model do

  it 'should belong to a user' do
    should belong_to :user
  end

  it 'should belong to a post' do
    should belong_to :post
  end

  it 'should have content' do
    @user = User.create(email: "khicks@test.com",
                    password: "123456",
                    password_confirmation: "123456")

    @post = Post.create(user_id: @user.id,
                    caption: "Beautiful photo!",
                    image: File.new(Rails.root + 'spec/assets/test_canyon.jpg'),
                    created_at: @time)

    @comment = Comment.create(user_id: @user.id,
                    post_id: @post.id,
                    content: "Really like this photo...")

    expect(@comment.content).to eq("Really like this photo...")
  end

end
