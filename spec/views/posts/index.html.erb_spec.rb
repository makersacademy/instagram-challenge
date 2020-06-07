require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        message: "Message",
        picture: "Picture"
      ),
      Post.create!(
        message: "Message",
        picture: "Picture"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", text: "Message".to_s, count: 2
    assert_select "tr>td", text: "Picture".to_s, count: 2
  end
end
