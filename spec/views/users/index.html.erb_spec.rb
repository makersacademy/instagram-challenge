require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        email: "Email",
        password: "Password",
        first_name: "First Name",
        last_name: "Last Name",
        admin: false
      ),
      User.create!(
        email: "Email",
        password: "Password",
        first_name: "First Name",
        last_name: "Last Name",
        admin: false
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Password".to_s, count: 2
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
