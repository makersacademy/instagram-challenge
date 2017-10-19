require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it 'returns the user username' do
    user = create(:user)
    post = Post.create(title: 'test', user_id: user.id)
    expect(post.author_username).to eq user.username
  end
end
