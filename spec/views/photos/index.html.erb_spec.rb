require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before(:each) do
    assign(:photos, [create(:photo), create(:photo)])
  end

  xit "renders a list of photos" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "rubber_duck.jpg".to_s, count: 2
  end
end
