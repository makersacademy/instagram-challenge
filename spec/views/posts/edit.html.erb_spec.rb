require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do

    user = User.create({email: "test@mail.com", password: "password"})
    @post = assign(:post, Post.create!(
      :content => "MyText",
      :picture => "MyString",
      :user_id => user.id
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "textarea#post_content[name=?]", "post[content]"

    
    end
  end
end
