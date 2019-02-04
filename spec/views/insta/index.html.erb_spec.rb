# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "insta/index", type: :view do
  before(:each) do
    assign(:insta, [
      Instum.create!(
        title: "Title",
        caption: "MyText"
      ),
      Instum.create!(
        title: "Title",
        caption: "MyText"
      )
    ])
  end

  it "renders a list of insta" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
