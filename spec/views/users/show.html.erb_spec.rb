require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :username => "Josh",
      :password => "password",
      :email => "josh@gmail.com"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Email/)
  end
end
