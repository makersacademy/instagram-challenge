require 'rails_helper'

RSpec.describe "likes/new", type: :view do
  before(:each) do
    assign(:like, Like.new(
      :number_of_likes => 1,
      :user => nil,
      :picture => nil
    ))
  end

  it "renders new like form" do
    render

    assert_select "form[action=?][method=?]", likes_path, "post" do

      assert_select "input[name=?]", "like[number_of_likes]"

      assert_select "input[name=?]", "like[user_id]"

      assert_select "input[name=?]", "like[picture_id]"
    end
  end
end
