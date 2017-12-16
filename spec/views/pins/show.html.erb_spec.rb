require 'rails_helper'

RSpec.describe "pins/show", type: :view do
  before(:each) do
    user = User.create(email: "test@example.com", password: "123456")
    @pin = assign(:pin, Pin.create!(user_id: user.id, image: "photo.jpg", caption: "caption"))
  end

  it "renders attributes in <p>" do
    render
  end
end
