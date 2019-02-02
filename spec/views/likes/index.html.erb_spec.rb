require 'rails_helper'

RSpec.describe "likes/index", type: :view do
  before(:each) do
    assign(:likes, [
      Like.create!(
        :post_id => 2,
        :user_id => 3
      ),
      Like.create!(
        :post_id => 2,
        :user_id => 3
      )
    ])
  end

  it "renders a list of likes" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
