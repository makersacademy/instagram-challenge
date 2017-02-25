require 'rails_helper'

RSpec.describe "posts/index.html.erb", type: :view do
  it "renders expected template" do
    render
  expect(rendered).to match /HTML/
  end
end
