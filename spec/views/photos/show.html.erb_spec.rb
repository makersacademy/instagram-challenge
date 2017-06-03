require 'rails_helper'

RSpec.describe "photos/show", type: :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :description => "MyText",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Image/)
  end
end
