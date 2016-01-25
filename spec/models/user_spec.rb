require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many(:photos).dependent(:destroy)  }
  it { is_expected.to have_many :liked_photos }


  describe '#owns?' do
    it 'returns true if the photo is owned by the user' do
      user = User.create(username: 'test', email: 'email@email.com', password: '1234pass')
      photo = Photo.new(image_file_name: nil)
      photo.user_id = user.id
      photo.save
      expect(user.owns?(photo)).to be true
    end
  end

  describe '#has_liked?' do
    it 'returns true if the photo was liked by the user' do
      user1 = User.create(username: 'test', email: 'email@email.com', password: '1234pass')
      photo = Photo.new(image_file_name: nil)
      photo.user_id = user1.id
      photo.save
      user2 = User.create(username: 'test2', email: 'email2@email.com', password: '1234pass')
      photo.likes.create(user_id: user2.id)
      expect(user2.has_liked?(photo)).to be true
    end
  end
end
