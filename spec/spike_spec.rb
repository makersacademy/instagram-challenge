require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'can create a new post' do
    post = Post.create(text: '123456')
    expect(like).to be_valid
  end
end
