require 'rails_helper'

RSpec.describe "likes/index", type: :view do
  before(:each) do
    assign(:likes, [
      Like.create!(
        :number_of_likes => 2,
        :user => nil,
        :picture => nil
      ),
      Like.create!(
        :number_of_likes => 2,
        :user => nil,
        :picture => nil
      )
    ])
  end

  it "renders a list of likes" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
