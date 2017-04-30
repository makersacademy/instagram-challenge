require 'rails_helper'

describe Like, type: :model do

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:picture) }
  end

  describe 'validations' do
    let(:image_desc) { "Description" }
    let(:image_file_jpeg) { File.new('spec/features/Mountains.jpg') }
    let(:user) { User.create(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest', username: 'varvara')
  }
    let(:picture) { user.pictures.create(description: image_desc, image: image_file_jpeg)}


    it 'user can only like an image once' do
      picture.likes.create_with_user(user)
      like = picture.likes.build_with_user(user)
      expect(like).not_to be_valid
    end
  end

end
