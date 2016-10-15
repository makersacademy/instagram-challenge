require 'rails_helper'

RSpec.describe "likes/index", type: :view do
  before(:each) do
    assign(:likes, [
      Like.create!(),
      Like.create!()
    ])
  end

  it "renders a list of likes" do
    render
  end
end
