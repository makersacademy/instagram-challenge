require 'rails_helper'

RSpec.describe "pins/index", type: :view do
  before(:each) do
    user = User.create(email: "test@example.com", password: "123456")
    assign(:pins, [
      Pin.create!(user_id: user.id, image: "photo.jpg", caption: "caption"),
      Pin.create!(user_id: user.id, image: "photo2.jpg", caption: "caption2")
    ])
  end

  it "renders a list of pins" do
    render
  end
end
