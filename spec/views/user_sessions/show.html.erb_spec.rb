require 'rails_helper'

RSpec.describe "user_sessions/show", type: :view do
  before(:each) do
    @user_session = assign(:user_session, UserSession.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
