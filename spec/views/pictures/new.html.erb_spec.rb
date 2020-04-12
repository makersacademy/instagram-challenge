require 'rails_helper'

RSpec.describe "pictures/new", type: :view do
  before(:each) do
    assign(:picture, Picture.new(
      image_url: "MyString",
      user: nil
    ))
  end

  it "renders new picture form" do
    render

    assert_select "form[action=?][method=?]", pictures_path, "post" do

      assert_select "input[name=?]", "picture[image_url]"

      assert_select "input[name=?]", "picture[user_id]"
    end
  end
end
