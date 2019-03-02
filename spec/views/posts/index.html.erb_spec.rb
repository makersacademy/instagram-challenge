require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(message: "hello", user_id: 1),
      Post.create!(message: "hello2", user_id: 2)
    ])
  end

  it "renders a list of posts" do
    render
  end
end
