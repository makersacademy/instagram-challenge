require 'rails_helper'

RSpec.describe "likes/index", type: :view do
  before(:each) do
    assign(:likes, [
      Like.create!(
        user_id: "User",
        post_id: "Post"
      ),
      Like.create!(
        user_id: "User",
        post_id: "Post"
      )
    ])
  end

  it "renders a list of likes" do
    render
    assert_select "tr>td", text: "User".to_s, count: 2
    assert_select "tr>td", text: "Post".to_s, count: 2
  end
end
