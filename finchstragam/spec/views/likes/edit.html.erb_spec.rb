require 'rails_helper'

RSpec.describe "likes/edit", type: :view do
  before(:each) do
    @like = assign(:like, Like.create!(
      :number_of_likes => 1,
      :user => nil,
      :picture => nil
    ))
  end

  it "renders the edit like form" do
    render

    assert_select "form[action=?][method=?]", like_path(@like), "post" do

      assert_select "input[name=?]", "like[number_of_likes]"

      assert_select "input[name=?]", "like[user_id]"

      assert_select "input[name=?]", "like[picture_id]"
    end
  end
end
