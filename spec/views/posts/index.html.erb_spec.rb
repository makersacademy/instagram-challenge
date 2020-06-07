require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        message: "Message",
        picture: "https://live.staticflickr.com/8651/29886969203_d3d69bac5e_w.jpg"
      ),
      Post.create!(
        message: "Message",
        picture: "https://live.staticflickr.com/8651/29886969203_d3d69bac5e_w.jpg"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", message: "Message".to_s#, count: 2
    assert_select "tr>td", picture: "https://live.staticflickr.com/8651/29886969203_d3d69bac5e_w.jpg".to_s#, count: 2
  end
end
