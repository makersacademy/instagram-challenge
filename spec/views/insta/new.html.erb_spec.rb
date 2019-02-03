require 'rails_helper'

RSpec.describe "insta/new", type: :view do
  before(:each) do
    assign(:instum, Instum.new(
      :title => "MyString",
      :caption => "MyText"
    ))
  end

  it "renders new instum form" do
    render

    assert_select "form[action=?][method=?]", insta_path, "post" do

      assert_select "input[name=?]", "instum[title]"

      assert_select "textarea[name=?]", "instum[caption]"
    end
  end
end
