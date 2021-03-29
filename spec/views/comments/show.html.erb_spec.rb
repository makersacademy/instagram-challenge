require 'rails_helper'

RSpec.describe "comments/show", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      body: "Body",
      user_id: 2,
      post_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Body/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
