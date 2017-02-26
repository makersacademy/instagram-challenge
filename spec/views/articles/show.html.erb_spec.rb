require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  Devise::Test::ControllerHelpers
  before(:each) do
    @user = User.create!({
      :email => 'user@test.com',
      :password => 'please',
      :password_confirmation => 'please'
    })
    @article = assign(:article, Article.create!(
      :description => "Description", user_id: User.last.id
    ))
  end
  # 
  # it "renders attributes in <p>" do
  #   render
  #   expect(rendered).to match(/Description/)
  # end
end
