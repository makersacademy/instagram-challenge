require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        :caption => "Caption",
        :user => nil
      ),
      Photo.create!(
        :caption => "Caption",
        :user => nil
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", :text => "Caption".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
