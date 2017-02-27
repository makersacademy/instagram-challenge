require "rails_helper"

RSpec.describe "articles/edit", type: :view do
  before(:each) do
    @user = User.create!(
      email:  'user@test.com',
      password:  'please',
      password_confirmation:  'please'
    )
    @article = assign(:article, Article.create!(
    description: "Description", user_id: User.last.id
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input#article_description[name=?]", "article[description]"
    end
  end
end
