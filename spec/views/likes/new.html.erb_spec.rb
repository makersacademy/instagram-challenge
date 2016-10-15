require 'rails_helper'

RSpec.describe "likes/new", type: :view do
  before(:each) do
    assign(:like, Like.new())
  end

  it "renders new like form" do
    render

    assert_select "form[action=?][method=?]", likes_path, "post" do
    end
  end
end
