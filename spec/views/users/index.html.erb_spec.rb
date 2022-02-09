require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        email: "Email",
        password_digest: "Password Digest",
        username: "Username",
        bio: "Bio"
      ),
      User.create!(
        email: "Email",
        password_digest: "Password Digest",
        username: "Username",
        bio: "Bio"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Password Digest".to_s, count: 2
    assert_select "tr>td", text: "Username".to_s, count: 2
    assert_select "tr>td", text: "Bio".to_s, count: 2
  end
end
