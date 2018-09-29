require 'rails_helper'

RSpec.describe "posts/index.html.erb", type: :view do

  before(:each) do
    test_user = User.new(email: "fake123@cd.com", password: "123456")
    assign(:posts, [Post.new(:image => "http://google.com", :description => "Test description", :user => test_user)])
  end

  scenario "renders new view" do
    render
    expect(rendered).to have_content("Test description")
  end
end