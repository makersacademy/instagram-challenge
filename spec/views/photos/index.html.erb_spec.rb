require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        :description => "Description"
      ),
      Photo.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
