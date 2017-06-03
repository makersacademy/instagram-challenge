require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        :description => "MyText",
        :image => "Image"
      ),
      Photo.create!(
        :description => "MyText",
        :image => "Image"
      )
    ])
  end

  xit "renders a list of photos" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
