require 'rails_helper'

RSpec.describe "user_sessions/new", type: :view do
  before(:each) do
    assign(:user_session, UserSession.new())
  end

  it "renders new user_session form" do
    render

    assert_select "form[action=?][method=?]", user_sessions_path, "post" do
    end
  end
end
