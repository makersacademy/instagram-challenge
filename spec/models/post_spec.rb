require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'should belong to a user' do
    post = Post.reflect_on_association(:user)
    expect(post.macro).to eq(:belongs_to)
  end
end
