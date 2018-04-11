require 'rails_helper'

RSpec.describe "pictures/edit", type: :view do
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      :link => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit picture form" do
    render

    assert_select "form[action=?][method=?]", picture_path(@picture), "post" do

      assert_select "input[name=?]", "picture[link]"

      assert_select "input[name=?]", "picture[description]"
    end
  end
end
