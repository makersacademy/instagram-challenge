require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    user = User.create({email: "test@mail.com", password: "password"})
    assign(:posts, [
      Post.create!(
        :content => "MyText",
        :picture => "Picture",
        :user_id => user.id
      ),
      Post.create!(
        :content => "MyText",
        :picture => "Picture",
        :user_id => user.id
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
  end
end
