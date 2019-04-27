require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :description => "MyString",
      :likes => 1,
      :user => nil
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[description]"

      assert_select "input[name=?]", "post[likes]"

      assert_select "input[name=?]", "post[user_id]"
    end
  end
end
