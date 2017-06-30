require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :name => "MyString",
      :title => "MyString",
      :content => "MyText",
      :picture => "MyString"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_name[name=?]", "post[name]"

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "textarea#post_content[name=?]", "post[content]"

      assert_select "input#post_picture[name=?]", "post[picture]"
    end
  end
end
