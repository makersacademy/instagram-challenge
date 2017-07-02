require 'rails_helper'

RSpec.describe Comment, type: :model do

  password = "password"
  username = "username"
  user = FactoryGirl.create(:user, username: username, password: password)
  post = user.posts.create(caption: 'Lorem Ipsum', image: 'img.jpeg')
  comment = post.comments.create(body: 'Lorem Ipsum')

  it 'should have a body' do
    expect(comment.body).to eq('Lorem Ipsum')
  end

  it 'should have the ID of parent post' do
    expect(comment.post_id).to eq(post.id)
  end
# 

end
