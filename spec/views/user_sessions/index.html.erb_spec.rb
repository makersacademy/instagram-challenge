require 'rails_helper'

RSpec.describe "user_sessions/index", type: :view do
  before(:each) do
    assign(:user_sessions, [
      UserSession.create!(),
      UserSession.create!()
    ])
  end

  it "renders a list of user_sessions" do
    render
  end
end
