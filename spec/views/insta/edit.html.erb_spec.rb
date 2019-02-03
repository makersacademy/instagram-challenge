require 'rails_helper'

RSpec.describe "insta/edit", type: :view do
  before(:each) do
    @instum = assign(:instum, Instum.create!(
      :title => "MyString",
      :caption => "MyText"
    ))
  end

  it "renders the edit instum form" do
    render

    assert_select "form[action=?][method=?]", instum_path(@instum), "post" do

      assert_select "input[name=?]", "instum[title]"

      assert_select "textarea[name=?]", "instum[caption]"
    end
  end
end
