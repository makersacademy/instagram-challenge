# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    user = User.find_by id: 1
    @post = assign(:post, Post.create!(
                            uri: "Uri",
                            user: user
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Uri/)
    expect(rendered).to match(//)
  end
end
