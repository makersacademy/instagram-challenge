require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    @u = User.new(:email => "user@name.com", :password => 'password', :password_confirmation => 'password')
    @u.save
    
    assign(:post, Post.new(
      :image => "MyString",
      :caption => "MyText",
      :user => @u
    ))
  end

  it "renders new post form" do
    skip("Warden missing, needs investigating")
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input[name=?]", "post[image]"

      assert_select "textarea[name=?]", "post[caption]"

     # assert_select "input[name=?]", "post[user_id]"
    end
  end
end
