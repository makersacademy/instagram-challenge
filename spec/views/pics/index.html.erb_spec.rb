require 'rails_helper'

RSpec.describe "pics/index", type: :view do
  before(:each) do
    @user = User.create(email: "a@a.com", password: "abc123", id: 1)
    assign(:pics, [
      Pic.create!(
        :title => "Test pic",
        :description => "Test Pic Body",
        :picture_file_name => "testpic.jpg",
        :user => @user
      ),
      Pic.create!(
        :title => "Test pic",
        :description => "Test Pic Body",
        :picture_file_name => "testpic.jpg",
        :user => @user
      )
    ])
  end

  it "renders a list of pics" do
    render
    assert_select "div.box", { :count => 2 }
    assert_select "div.box", { :count => 2, :title => "Test pic" }
  end
end
