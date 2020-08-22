require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(user_id: 1, image: fixture_file_upload('unknown.jpg')),
      Post.create!(user_id: 2, image: fixture_file_upload('unknown.jpg'))
    ])
  end

  it "renders a list of posts" do
    render
  end
end
