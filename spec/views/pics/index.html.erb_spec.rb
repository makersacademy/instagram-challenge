require 'rails_helper'

RSpec.describe "pics/index", type: :view do
  before(:each) do
    @user = User.create(email: "a@a.com", password: "abc123", id: 1)
    assign(:pics, [
      Pic.create!(
        :title => "Title",
        :description => "MyText",
        :picture => "Picture",
        :user_id => 1
      ),
      Pic.create!(
        :title => "Title",
        :description => "MyText",
        :picture => "Picture",
        :user_id => 1
      )
    ])
  end

  it "renders a list of pics" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
  end
end
