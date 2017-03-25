require 'rails_helper'

describe Like, type: :model do

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:image) }
  end

  describe 'validations' do
    let(:image_title) { "Beast and Magneto" }
    let(:image_desc) { "Two cheeky Rabbits" }
    let(:image_file_jpeg) { File.new('spec/fixture/test_rabbits.jpeg') }
    let(:user) { create_test_user }
    let(:image) { user.images.create(title: image_title, description: image_desc, image_file: image_file_jpeg)}

    it 'user can only like an image once' do
      image.likes.create_with_user(user)
      test_like = image.likes.build_with_user(user)
      expect(test_like).to have(1).error_on(:user)
      expect(test_like).not_to be_valid
    end
  end

end
