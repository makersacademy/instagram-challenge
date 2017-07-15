require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it 'Can create a new post' do
    User.create(name: 'Jade', email: 'jade@jade.com', password: '123456')
    post = Post.create(text: "Hello test!", photo: "pretend_photo.png", user_id: 1)
    expect(post).to be_valid
  end

  it 'Cannot create a post without reference to a user' do
    post = Post.create(text: "Hello test!", photo: "pretend_photo.png")
    expect(post).not_to be_valid
  end

end
