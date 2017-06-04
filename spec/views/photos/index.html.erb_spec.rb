require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        :title => "Title"
      ),
      Photo.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
