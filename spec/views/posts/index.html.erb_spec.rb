# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    @user = User.find_by id: 1
    assign(:posts, [
      Post.create!(
        uri: "Uri",
        user: @user
      ),
      Post.create!(
        uri: "Uri",
        user: @user
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", text: "Uri".to_s, count: 2
    assert_select "tr>td", text: @user.to_s, count: 2
  end
end
