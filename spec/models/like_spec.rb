require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'Likes have user and post ids' do
    user = User.create(username: 'User Name', email: 'test@example.com',
                       password: 'my_secret')
    post = Post.create(image: File.new(Rails.root + 'spec/support/IMG_0655.JPG'),
                      caption: 'test photo', user_id: user.id)
    like = Like.new(user_id: user.id, post_id: post.id)
    expect(like).to be_valid
  end
end
