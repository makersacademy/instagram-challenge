require 'rails_helper'

describe Image, type: :model do

  let(:image_title) { "Beast and Magneto" }
  let(:image_desc) { "Two cheeky Rabbits" }
  let(:image_file_jpeg) { File.new('spec/fixture/test_rabbits.jpeg') }

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
  end

  context 'validations' do
    it 'is not valid with a title less than three chars' do
      test_image = Image.new(title: 'kf', description: image_desc, image_file: image_file_jpeg)
      expect(test_image).to have(1).error_on(:title)
      expect(test_image).not_to be_valid
    end
    it 'is not valid with a blank desc' do
      test_image = Image.new(title: image_title, description: '', image_file: image_file_jpeg)
      expect(test_image).to have(1).error_on(:description)
      expect(test_image).not_to be_valid
    end
    it 'is not valid with no image' do
      test_image = Image.new(title: image_title, description: image_desc, image_file: '')
      expect(test_image).to have(1).error_on(:image_file)
      expect(test_image).not_to be_valid
    end
    it 'will not accept wrong image type' do
      test_image = Image.new(title: image_title, description: image_desc, image_file: File.new('spec/fixture/test.svg'))
      expect(test_image).to have(1).error_on(:image_file)
      expect(test_image).not_to be_valid
    end
    it 'will not accept wrong file type' do
      test_image = Image.new(title: image_title, description: image_desc, image_file: File.new('spec/fixture/not_an_image.dat'))
      expect(test_image).to have(2).error_on(:image_file)
      expect(test_image).not_to be_valid
    end
  end

  describe '#liked_by_current_user' do

    let(:user) { create_test_user }
    let(:image) { user.images.create(title: image_title, description: image_desc, image_file: image_file_jpeg)}

    context 'not yet liked' do
      it 'returns false' do
        expect(image.liked_by_current_user?(user)).to be false
      end
    end

    context 'already liked' do
      it 'returns true' do
        image.likes.create_with_user(user)
        expect(image.liked_by_current_user?(user)).to be true
      end
    end

  end

end
