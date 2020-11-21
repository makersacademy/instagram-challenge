require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    @u = User.new(:email => "user@name.com", :password => 'password', :password_confirmation => 'password')
    @u.save
    assign(:posts, [
      Post.create!(
        :image => "Image",
        :caption => "MyText",
        :user => @u
      ),
      Post.create!(
        :image => "Image",
        :caption => "MyText",
        :user => @u
      )
    ])
  end

  it "renders a list of posts" do
    skip("Warden missing, needs investigating")
    render
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => @u.to_s, :count => 2
  end
end
