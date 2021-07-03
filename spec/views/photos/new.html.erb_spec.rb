require 'rails_helper'

RSpec.describe "photos/new", type: :view do
  before(:each) do
    assign(:photo, Photo.new(
      :name => "MyString",
      :description => "MyText",
      :image => "MyString"
    ))
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input[name=?]", "photo[name]"

      assert_select "textarea[name=?]", "photo[description]"

      assert_select "input[name=?]", "photo[image]"
    end
  end
end
