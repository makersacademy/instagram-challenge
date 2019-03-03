# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    user = User.find_by id: 1
    post2 = Post.create(uri: 'I am the second', user_id: 1)
    post2.picture.attach(io: File.open(Rails.root + 'app/assets/images/test2.jpg'), filename: 'test2.jpg')
    @post = assign(:post, post2)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Uri/)
    expect(rendered).to match(//)
  end

  it 'contains the text caption' do
    render
    assert_select "div", text: "I am the second", count: 1
  end

  it 'contains the uploaded images' do
    render
    assert_select "img:match('src', ?)", /test2.jpg/
  end

  it 'contains the username of the uploader' do
    render
    assert_select "div", text: 'bob', count: 1
  end
end
