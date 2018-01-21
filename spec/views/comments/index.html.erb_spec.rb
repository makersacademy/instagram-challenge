require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        :post => nil,
        :content => "MyText"
      ),
      Comment.create!(
        :post => nil,
        :content => "MyText"
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
