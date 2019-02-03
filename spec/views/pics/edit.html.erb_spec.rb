require 'rails_helper'

RSpec.describe "pics/edit", type: :view do
  before(:each) do
    @user = User.create(email: "a@a.com", password: "abc123", id: 1)
    @pic = assign(:pic, Pic.create!(
      :title => "MyString",
      :description => "MyText",
      :picture => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit pic form" do
    render

    assert_select "form[action=?][method=?]", pic_path(@pic), "post" do

      assert_select "input[name=?]", "pic[title]"

      assert_select "textarea[name=?]", "pic[description]"

      assert_select "input[name=?]", "pic[picture]"
    end
  end
end
