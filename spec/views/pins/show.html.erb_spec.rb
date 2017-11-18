require 'rails_helper'

RSpec.describe "pins/show", type: :view do
  before(:each) do
    @pin = assign(:pin, Pin.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
