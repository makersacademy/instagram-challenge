require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        post_id: "Post",
        string: "String",
        user_id: "User",
        string: "String",
        content: "Content",
        string: "String"
      ),
      Comment.create!(
        post_id: "Post",
        string: "String",
        user_id: "User",
        string: "String",
        content: "Content",
        string: "String"
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", text: "Post".to_s, count: 2
    assert_select "tr>td", text: "String".to_s, count: 2
    assert_select "tr>td", text: "User".to_s, count: 2
    assert_select "tr>td", text: "String".to_s, count: 2
    assert_select "tr>td", text: "Content".to_s, count: 2
    assert_select "tr>td", text: "String".to_s, count: 2
  end
end
