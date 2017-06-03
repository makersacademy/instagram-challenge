require 'rails_helper'

RSpec.describe "photos/show", type: :view do

  it "renders attributes in <p>" do
    @photo = create(:photo)
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/img src/)
  end
end
