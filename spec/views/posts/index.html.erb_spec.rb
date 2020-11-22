require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    @u = create(:user)
    allow(view).to receive(:current_user).and_return(@u)
    
    assign(:posts, [
      Post.create!(
        :image => "img",
        :caption => "First",
        :user_id => @u.id
      ),
      Post.create!(
        :image => "img",
        :caption => "Second",
        :user_id => @u.id
      )
    ])
  end

  it "renders a list of posts" do
    render
    expect(rendered).to match(/First/)
    expect(rendered).to match(/Second/)
    assert_select "div[id='username']", :text => "#{@u.username}", :count => 2
  end
end
