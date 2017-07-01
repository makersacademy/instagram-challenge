require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    user = User.create({email: "test@mail.com", password: "password"})
    @post = assign(:post, Post.create!(
      :name => "Name",
      :title => "Title",
      :content => "MyText",
      :picture => "Picture",
      :user_id => user.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Picture/)
  end
end
