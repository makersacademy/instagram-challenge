require 'rails_helper'

RSpec.describe "pics/show", type: :view do
  before(:each) do
    @user = User.create(email: "a@a.com", password: "abc123", id: 1)
    @pic = assign(:pic, Pic.create!(
      :title => "Title",
      :description => "MyText",
      :picture => "Picture",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Picture/)
  end
end
