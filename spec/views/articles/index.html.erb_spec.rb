require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :description => "Description"
      ),
      Article.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
