require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      caption: "Caption",
      has_attachment: "Has Attachment"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Caption/)
    expect(rendered).to match(/Has Attachment/)
  end
end
