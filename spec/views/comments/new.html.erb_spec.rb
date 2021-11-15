require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      post_id: "MyString",
      string: "MyString",
      user_id: "MyString",
      string: "MyString",
      content: "MyString",
      string: "MyString"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input[name=?]", "comment[post_id]"

      assert_select "input[name=?]", "comment[string]"

      assert_select "input[name=?]", "comment[user_id]"

      assert_select "input[name=?]", "comment[string]"

      assert_select "input[name=?]", "comment[content]"

      assert_select "input[name=?]", "comment[string]"
    end
  end
end
