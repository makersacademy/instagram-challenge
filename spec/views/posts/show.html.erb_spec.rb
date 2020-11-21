require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @u = create(:user)
    allow(view).to receive(:current_user).and_return(@u)
    
    @post = assign(:post, Post.create!(
      :image => "file.jpg",
      :caption => "MyText",
      :user_id => @u.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/#{@u.username}/)
  end
end
