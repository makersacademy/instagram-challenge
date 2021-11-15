require 'rails_helper'

RSpec.describe "comments/show", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      post_id: "Post",
      string: "String",
      user_id: "User",
      string: "String",
      content: "Content",
      string: "String"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Post/)
    expect(rendered).to match(/String/)
    expect(rendered).to match(/User/)
    expect(rendered).to match(/String/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/String/)
  end
end
