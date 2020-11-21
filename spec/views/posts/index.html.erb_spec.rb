require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    @u = create(:user)
    allow(view).to receive(:current_user).and_return(@u)
    
    assign(:posts, [
      Post.create!(
        :image => "Image",
        :caption => "MyText",
        :user_id => @u.id
      ),
      Post.create!(
        :image => "Image",
        :caption => "MyText",
        :user_id => @u.id
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => @u.to_s, :count => 2
  end
end
