require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    @u = create(:user)
    allow(view).to receive(:current_user).and_return(@u)
    
    assign(:post, Post.new(
      :image => "MyString",
      :caption => "MyText",
      :user_id => @u.id
    ))
  end

  it "renders new post form" do
    ("Warden missing, needs investigating")
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input[name=?]", "post[image]"

      assert_select "textarea[name=?]", "post[caption]"

     # assert_select "input[name=?]", "post[user_id]"
    end
  end
end
