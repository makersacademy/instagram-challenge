require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @u = User.new(:email => "user@name.com", :password => 'password', :password_confirmation => 'password')
    @u.save
    @post = assign(:post, Post.create!(
      :image => "MyString",
      :caption => "MyText",
      :user => @u
    ))
   
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[image]"

      assert_select "textarea[name=?]", "post[caption]"

      assert_select "input[name=?]", "post[user_id]"
    end
  end
end
