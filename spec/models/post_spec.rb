require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it 'returns the user email' do
    user = create(:user)
    post = Post.create(title: 'test', user_id: user.id)
    expect(post.user_email).to eq user.email
  end
end
