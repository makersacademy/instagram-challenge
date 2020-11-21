require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @u = create(:user)
    allow(view).to receive(:current_user).and_return(@u)
    
    @post = assign(:post, Post.create!(
      :image => "MyString",
      :caption => "MyText",
      :user_id => @u.id
    ))
   
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

     # assert_select "input[name=?]", "post[image]"

      assert_select "textarea[name=?]", "post[caption]"

      assert_select "input[name=?]", "post[user_id]"
    end
  end
end
