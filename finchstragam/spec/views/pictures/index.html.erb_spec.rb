require 'rails_helper'

RSpec.describe "pictures/index", type: :view do
  before(:each) do
    assign(:pictures, [
      Picture.create!(
        :pic => "Pic",
        :description => "Description"
      ),
      Picture.create!(
        :pic => "Pic",
        :description => "Description"
      )
    ])
  end

  it "renders a list of pictures" do
    render
    assert_select "tr>td", :text => "Pic".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
