require 'rails_helper'

RSpec.describe "posts/index.html.erb", type: :view do
pending  it "displays post details" do
    assign(:post, Post.new(title: 'Poppy'))
    render
    render.should contain('Poppy')
  end
end
