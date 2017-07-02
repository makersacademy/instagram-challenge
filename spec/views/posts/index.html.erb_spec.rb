require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    user = User.create({email: "test@mail.com", password: "password"})
    assign(:posts, [
      Post.create!(
        :content => "MyText",
        :picture => "https://pbs.twimg.com/profile_images/3087236754/91e379b7e0006d38ee0526946a38a1ea_400x400.png",
        :user_id => user.id
      ),
      Post.create!(
        :content => "MyText",
        :picture => "https://pbs.twimg.com/profile_images/3087236754/91e379b7e0006d38ee0526946a38a1ea_400x400.png",
        :user_id => user.id
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
