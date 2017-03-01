require 'rails_helper'
require 'timecop'

describe Like, type: :model do

  it 'should belong to a user' do
    should belong_to :user
  end

  it 'should belong to a post' do
    should belong_to :post
  end

  it 'is not valid if user likes own post' do
    @user = User.create(email: "khicks@test.com",
                    password: "123456",
                    password_confirmation: "123456")

    @post = Post.create(user_id: @user.id,
                    caption: "Beautiful photo!",
                    image: File.new(Rails.root + 'spec/assets/test_canyon.jpg'),
                    created_at: @time)

    @like = Like.create(user_id: @user.id, post_id: @post.id)

    expect(@like).to_not be_valid
  end

  it 'is is not valid if user has already liked post' do
    @user_one = User.create(email: "khicks@test.com",
                    password: "123456",
                    password_confirmation: "123456")

    @user_two = User.create(email: "maggie_a_hicks@hotmail.com",
                    password: "123456",
                    password_confirmation: "123456")

    @post = Post.create(user_id: @user_one.id,
                    caption: "Beautiful photo!",
                    image: File.new(Rails.root + 'spec/assets/test_canyon.jpg'),
                    created_at: @time)

    @like_one = Like.create(user_id: @user_two.id, post_id: @post.id)
    @like_two = Like.create(user_id: @user_two.id, post_id: @post.id)

    expect(@like_two).to_not be_valid
  end

end
