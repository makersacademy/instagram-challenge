require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @u = User.new(:email => "user@name.com", :password => 'password', :password_confirmation => 'password')
    @u.save
    @post = assign(:post, Post.create!(
      :image => "Image",
      :caption => "MyText",
      :user => @u
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
