# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
                            caption: "MyString",
                            picture: "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do
      assert_select "input[name=?]", "post[caption]"

      assert_select "input[name=?]", "post[picture]"
    end
  end
end
