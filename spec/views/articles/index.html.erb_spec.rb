require "rails_helper"

RSpec.describe "articles/index", type: :view do
  before(:each) do
    @user = User.create!(
      email:  'user@test.com',
      password:  'please',
      password_confirmation:  'please'
    )
    assign(:articles, [
      Article.create!(
        description: "Description", user_id: User.last.id
      ),
      Article.create!(
        description: "Description", user_id: User.last.id
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
