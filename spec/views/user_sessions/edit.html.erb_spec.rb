require 'rails_helper'

RSpec.describe "user_sessions/edit", type: :view do
  before(:each) do
    @user_session = assign(:user_session, UserSession.create!())
  end

  it "renders the edit user_session form" do
    render

    assert_select "form[action=?][method=?]", user_session_path(@user_session), "post" do
    end
  end
end
