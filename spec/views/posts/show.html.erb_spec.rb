require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    current_user = User.new
    @post = assign(:post, Post.create!(
      :image => "",
      :desc => "MyText",
      :user => current_user.id
    ))
    @comment = Comment.new
  end

  # it "renders attributes in <p>" do
  #   render
  #   expect(rendered).to match(//)
  #   expect(rendered).to match(/MyText/)
  # end
end
