require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  include Devise::Test::ControllerHelpers

  let(:user) {user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") }

  before(:each) do
    sign_in user
   
    assign(:post, Post.new(
      :description => "MyString",
      :likes => 1,
      :user => user
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

    assert_select "input[name=?]", "post[description]"

    end
  end
end
