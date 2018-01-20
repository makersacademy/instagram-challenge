require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :image => "",
        :desc => "MyText"
      ),
      Post.create!(
        :image => "",
        :desc => "MyText"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
