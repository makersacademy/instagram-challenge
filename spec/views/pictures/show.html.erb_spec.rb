require 'rails_helper'

RSpec.describe "pictures/show", type: :view do
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      image_url: "Image Url",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(//)
  end
end
