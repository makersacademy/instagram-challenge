require 'rails_helper'

describe Like, type: :model do
  let!(:user1) { User.create(email: "1@test.org", password: "asdascrfsdfa") }
  let!(:user2) { User.create(email: "2@test.org", password: "asdascrfsdfa") }
  let!(:picture) { user1.pictures.create(image_file_name: "test") }

  it 'owner of the picture can like' do
    like = picture.likes.new
    like.user = user1
    expect(like.save).to be_truthy
  end

  it "anybody can like" do
    like = picture.likes.new
    like.user = user2
    expect(like.save).to be_truthy
  end
end
