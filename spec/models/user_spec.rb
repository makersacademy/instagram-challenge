require 'rails_helper'

RSpec.describe User, type: :model do
  it{ is_expected.to have_many(:photos).dependent(:destroy)}
  it{ is_expected.to have_many(:comments).dependent(:destroy)}
  it{ is_expected.to have_many(:likes)}
end

describe 'User' do
  let(:user1) { User.create(username: 'test', email: 'test@test.com', password: '12345678') }
  # let(:photo) { Photo.create description: 'Test' }
  let(:user2) { User.create(username: 'test2', email: 'test2@test.com', password: '12345678') }
  subject(:photo) { user1.photos.create({description: 'description1'})}




  describe '#owns?' do
    it 'owner of the photo should be user' do
      expect(user1.owns?(photo)).to eq true
    end

    it 'respond false if the owner of photo is not the user' do
      expect(user2.owns?(photo)).to eq false
    end
  end

  describe '#has_liked?' do
    it 'returns true if user has liked' do
      photo.likes.create_with_user(user1)
      expect(user1.has_liked?(photo)).to eq(true)
    end
  end

  describe "#get_usernames" do
    it 'returns the usernames of the entity' do
      photo.likes.create_with_user(user1)
      photo.likes.create_with_user(user2)
      expect(User.get_usernames(photo.likes)).to eq ('test, test2')
    end
  end
end
