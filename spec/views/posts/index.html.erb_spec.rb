require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :description => "Description"
      ),
      Post.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
