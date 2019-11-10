require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    user = User.create(email: 'user@email.com', password: 'password')
    Post.create(url: 'www.google.com', caption: 'A caption', user_id: user.id)
  end
  it 'knows its caption' do
    expect(Post.all.first.caption).to eq 'A caption'
  end

  it 'knows its image location' do
    expect(Post.all.first.url).to eq 'www.google.com'
  end

  it 'knows its user' do
    expect(Post.all.first.user).to eq user
  end
end
