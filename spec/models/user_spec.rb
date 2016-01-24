require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many(:photos).dependent(:destroy)  }

  describe '#owns?' do

    it 'returns true if the photo is owned by the user' do
      user = User.create(email: 'email@email.com', password: '1234pass')
      photo = Photo.new(image_file_name: nil)
      photo.user_id = user.id
      photo.save
      expect(user.owns?(photo)).to be true
    end
  end

end
