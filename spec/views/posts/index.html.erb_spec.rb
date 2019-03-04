# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    @user = User.find_by id: 1
    post1 = Post.create(caption: 'I am the first seeded picture', user_id: 1)
    post1.picture.attach(io: File.open(Rails.root + 'app/assets/images/test1.jpg'), filename: 'test1.jpg')

    post2 = Post.create(caption: 'I am the second', user_id: 1)
    post2.picture.attach(io: File.open(Rails.root + 'app/assets/images/test2.jpg'), filename: 'test2.jpg')
    assign(:posts, [post1, post2])

    like = Like.create(user_id: @user.id, post_id: post1.id)
    assign(:likes, like)

    sign_in User.find_by_id(1)

  end

  context "it renders a list of posts" do

    xit 'contains the uploaded images' do
      render
      # TODO: current_user in the ERB file is potentially nil when unit testing the view. How to get round?
      assert_select "tr>td>img:match('src', ?)", /test1.jpg/
      assert_select "tr>td>img:match('src', ?)", /test2.jpg/
    end

    xit 'contains the number of likes' do
      render
      assert_select "#like_count1", '1'
    end
  end
end
