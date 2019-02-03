require 'rails_helper'

RSpec.describe "pics/index", type: :view do
  before(:each) do
    @user = User.create(email: "a@a.com", password: "abc123", id: 1)
    assign(:pics, [
      Pic.create!(
        :title => "Title",
        :description => "MyText",
        :picture_file_name => "testpic.jpg",
        :user => @user
      ),
      Pic.create!(
        :title => "Title",
        :description => "MyText",
        :picture_file_name => "testpic.jpg",
        :user => @user
      )
    ])
  end

  it "renders a list of pics" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td>img", :count => 2
  end
end
