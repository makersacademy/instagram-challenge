require 'rails_helper'

RSpec.describe Comment, type: :model do
  xit 'a new comment can be created' do
    User.create(email: "test@test.com", name: "Test", username: "test")
    User.create(email: "test2@test2.com", name: "Test2", username: "test2")
    Photo.create(caption: "Paul Collingwood MBE", image: nil, user_id: 1)
    Comment.create(body: "test comment", photo_id: 1, user_id: 2)
    expect(Comment.last.body).to eq ("test comment")
  end
end
