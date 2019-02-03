require 'rails_helper'

RSpec.describe "insta/show", type: :view do
  before(:each) do
    @instum = assign(:instum, Instum.create!(
      :title => "Title",
      :caption => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
