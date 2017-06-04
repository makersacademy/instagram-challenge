require 'rails_helper'

RSpec.describe Post do
  it 'cannot be created without a user' do
    post = Post.create(description: 'post message')
    expect(post).to_not be_valid
  end

end
