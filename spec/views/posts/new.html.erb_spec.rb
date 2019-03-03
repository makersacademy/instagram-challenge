# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
                    caption: "MyString",
                    user: nil
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input[name=?]", "post[caption]"

      assert_select "input[name=?]", "post[user_id]"
    end
  end
end
