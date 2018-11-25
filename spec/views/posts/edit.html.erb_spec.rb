require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    User.create(username: 'username', email: 'user@user.com', password: 'pass123')
    @post = assign(:post, Post.create!(
      :description => "MyText",
      :image => upload_helper,
      :user_id => 1
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "textarea[name=?]", "post[description]"

      assert_select "input[name=?]", "post[image]"
    end
  end
end
