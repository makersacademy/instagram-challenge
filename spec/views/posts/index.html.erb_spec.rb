# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        caption: "MyText"
      ),
      Post.create!(
        caption: "MyText"
      )
    ])
  end

  # it "renders a list of posts" do
  #   render
  #   assert_select "tr>td", text: "MyText".to_s, count: 2
  # end
end
