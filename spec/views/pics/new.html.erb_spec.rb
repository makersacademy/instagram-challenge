require 'rails_helper'

RSpec.describe "pics/new", type: :view do
  before(:each) do
    @user = User.create(email: "a@a.com", password: "abc123", id: 1)
    assign(:pic, Pic.new(
      :title => "MyString",
      :description => "MyText",
      :picture_file_name => "testpic.jpg",
      :user => @user
    ))
  end

  it "renders new pic form" do
    render

    assert_select "form[action=?][method=?]", pics_path, "post" do

      assert_select "input[name=?]", "pic[title]"

      assert_select "textarea[name=?]", "pic[description]"

      assert_select "input[name=?]", "pic[picture]"
    end
  end
end
