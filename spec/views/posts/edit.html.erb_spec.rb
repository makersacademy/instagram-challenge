require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  include Devise::Test::ControllerHelpers

  let(:user) {user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") }

  before(:each) do
    sign_in user
    
    @post = assign(:post, Post.create!(
      :description => "MyString",
      :likes => 1,
      :user => user
    ))

  end
  
  it "renders the edit post form" do
  
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

    assert_select "input[name=?]", "post[description]"

    end
  end
end
