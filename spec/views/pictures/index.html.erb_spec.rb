require 'rails_helper'

RSpec.describe "pictures/index", type: :view do
  before(:each) do
    assign(:pictures, [
      Picture.create!(
        image_url: "Image Url",
        user: nil
      ),
      Picture.create!(
        image_url: "Image Url",
        user: nil
      )
    ])
  end

  it "renders a list of pictures" do
    render
    assert_select "tr>td", text: "Image Url".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
