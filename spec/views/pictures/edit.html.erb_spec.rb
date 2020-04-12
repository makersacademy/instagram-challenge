require 'rails_helper'

RSpec.describe "pictures/edit", type: :view do
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      image_url: "MyString",
      user: nil
    ))
  end

  it "renders the edit picture form" do
    render

    assert_select "form[action=?][method=?]", picture_path(@picture), "post" do

      assert_select "input[name=?]", "picture[image_url]"

      assert_select "input[name=?]", "picture[user_id]"
    end
  end
end
