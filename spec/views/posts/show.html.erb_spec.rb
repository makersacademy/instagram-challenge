require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "Title",
      :image_description => "ImageDescription"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/ImageDescription/)
  end
end
