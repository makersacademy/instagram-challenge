require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      message: "Message",
      picture: "https://live.staticflickr.com/8651/29886969203_d3d69bac5e_w.jpg"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Message/)
    expect(rendered).to match("https://live.staticflickr.com/8651/29886969203_d3d69bac5e_w.jpg")
  end
end
