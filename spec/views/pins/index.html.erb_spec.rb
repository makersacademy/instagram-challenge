require 'rails_helper'

RSpec.describe "pins/index", type: :view do
  before(:each) do
    assign(:pins, [
      Pin.create!(),
      Pin.create!()
    ])
  end

  it "renders a list of pins" do
    render
  end
end
