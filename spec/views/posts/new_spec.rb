require 'rails_helper'

RSpec.describe "posts/new.html.erb", type: :view do

  before(:each) do
    assign(:posts, Post.new(:image => "http://google.com", :description => "Test description"))
  end

  scenario "renders new view" do
    render
    expect(rendered).to have_content("Submit a New Post")
  end
end