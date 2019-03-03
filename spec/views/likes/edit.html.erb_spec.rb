# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "likes/edit", type: :view do
  before(:each) do
    user = User.find_by id: 1
    post = Post.create!(caption: "MyString", user: user)
    @like = assign(:like, Like.create!(
                            user: user,
                          post: post
    ))
  end

  it "renders the edit like form" do
    render

    assert_select "form[action=?][method=?]", like_path(@like), "post" do

      assert_select "input[name=?]", "like[post_id]"

      assert_select "input[name=?]", "like[user_id]"
    end
  end
end
