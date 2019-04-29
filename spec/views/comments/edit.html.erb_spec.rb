# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  let(:user) { user = User.create(first_name: "john", last_name: "snow", email: 'test@test.com', password: "password", password_confirmation: "password") }

  let(:post) { post = Post.create }

  before(:each) do
    @comment = assign(:comment, Comment.create!(
                                  body: "MyText",
                                  post: post,
                                  user: user
                                ))
  end

  it "renders the edit comment form" do
    # render

    # assert_select "form[action=?][method=?]", comment_path(@comment), "post" do
    #   assert_select "textarea[name=?]", "comment[body]"

    #   assert_select "input[name=?]", "comment[post_id]"

    #   assert_select "input[name=?]", "comment[user_id]"
    # end
  end
end
