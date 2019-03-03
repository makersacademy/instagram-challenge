require 'rails_helper'

RSpec.describe "likes/index", type: :view do
  before(:each) do
    @user = User.find_by id: 1
    @post = Post.create!(caption: "MyString", user: @user)
    like_1 = Like.create!(post: @post, user: @user)
    like_2 = Like.create!(post: @post, user: @user)
    assign(:likes, [like_1, like_2])
  end

  context "it renders a list of likes" do

    it 'contains the user ID' do
      render
      assert_select "tr>td", text: "User ID: #{@user.id}", count: 2
    end

    it 'contains the post ID' do
      render
      assert_select "tr>td", text: "Post ID: #{@post.id}", count: 2
    end
  end
end

