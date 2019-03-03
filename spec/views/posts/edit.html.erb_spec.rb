# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    user = User.find_by id: 1
    @post = assign(:post, Post.create!(
                            caption: "MyString",
                            user: user
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[caption]"

      assert_select "input[name=?]", "post[user_id]"
    end
  end
end
