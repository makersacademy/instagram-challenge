require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      title: "MyString",
      likes: 1,
      liked_by: "MyText",
      user: nil
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[title]"

      assert_select "input[name=?]", "post[likes]"

      assert_select "textarea[name=?]", "post[liked_by]"

      assert_select "input[name=?]", "post[user_id]"
    end
  end
end
