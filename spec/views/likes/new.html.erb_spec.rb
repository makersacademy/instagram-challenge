require 'rails_helper'

RSpec.describe "likes/new", type: :view do
  before(:each) do
    user = User.find_by id: 1
    post = Post.create!(caption: "MyString", user: user)
    assign(:like, Like.new(
      :post => post,
      :user => user
    ))
  end

  it "renders new like form" do
    render

    assert_select "form[action=?][method=?]", likes_path, "post" do

      assert_select "input[name=?]", "like[post_id]"

      assert_select "input[name=?]", "like[user_id]"
    end
  end
end
