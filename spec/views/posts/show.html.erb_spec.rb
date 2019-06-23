require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  include Devise::Test::ControllerHelpers

  let(:user) {user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") }

  before(:each) do
    sign_in user
    @post = assign(:post, Post.create!(
      :description => "Description",
      :likes => 2,
      :user => user
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
