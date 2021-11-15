require 'rails_helper'

RSpec.describe "likes/edit", type: :view do
  before(:each) do
    @like = assign(:like, Like.create!(
      user_id: "MyString",
      post_id: "MyString"
    ))
  end

  it "renders the edit like form" do
    render

    assert_select "form[action=?][method=?]", like_path(@like), "post" do

      assert_select "input[name=?]", "like[user_id]"

      assert_select "input[name=?]", "like[post_id]"
    end
  end
end
