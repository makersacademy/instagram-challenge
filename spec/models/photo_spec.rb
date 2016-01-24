require 'rails_helper'

describe Photo, type: :model do
  it { is_expected.to belong_to(:user)}

  feature '#username' do
    it 'returns the username of the owner' do
      user = User.create(username: 'allimac',email: 'camilla@email.com', password: 'pass1234')
      photo = Photo.new
      photo.user_id = user.id
      photo.save
      expect(photo.username).to eq user.username
    end
  end
end
