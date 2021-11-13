require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      post_id: "MyString",
      string: "MyString",
      user_id: "MyString",
      string: "MyString",
      content: "MyString",
      string: "MyString"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input[name=?]", "comment[post_id]"

      assert_select "input[name=?]", "comment[string]"

      assert_select "input[name=?]", "comment[user_id]"

      assert_select "input[name=?]", "comment[string]"

      assert_select "input[name=?]", "comment[content]"

      assert_select "input[name=?]", "comment[string]"
    end
  end
end
