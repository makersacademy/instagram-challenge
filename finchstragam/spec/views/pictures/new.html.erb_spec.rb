require 'rails_helper'

RSpec.describe "pictures/new", type: :view do
  before(:each) do
    assign(:picture, Picture.new(
      :link => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new picture form" do
    render

    assert_select "form[action=?][method=?]", pictures_path, "post" do

      assert_select "input[name=?]", "picture[link]"

      assert_select "input[name=?]", "picture[description]"
    end
  end
end
