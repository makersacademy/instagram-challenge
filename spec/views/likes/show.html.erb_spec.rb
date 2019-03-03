require 'rails_helper'

RSpec.describe "likes/show", type: :view do
  before(:each) do
    user = User.find_by id: 1
    post = Post.create!(caption: "MyString", user: user)
    @like = assign(:like, Like.create!(
      :post => post,
      :user => user
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
