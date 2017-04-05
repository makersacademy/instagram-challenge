require "rails_helper"

describe Picture, type: :model do

  let(:image_desc) { "I am a description" }
  let(:image_file_jpeg) { File.new('spec/features/Mountains.jpg') }

  context 'associations' do
   it { is_expected.to belong_to(:user) }
   it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  context 'validations' do
    it 'is not valid with a description less than two chars' do
      test_image = Picture.new(description: "a", image: image_file_jpeg)
      expect(test_image).not_to be_valid
    end
    it 'is not valid with a blank desc' do
      test_image = Picture.new( description: '', image: image_file_jpeg)
      expect(test_image).not_to be_valid
    end
    it 'is not valid with no image' do
      test_image = Picture.new(description: image_desc, image: '')
      expect(test_image).not_to be_valid
    end
  end

  # context "likes" do
  #   let(:user) { User.create(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest', username: 'varvara')
  #   }
  #   let(:picture) { user.pictures.create(description: image_desc, image: image_file_jpeg)}
  #
  #   it "has no likes" do
  #     picture.like
  #     expect
  #   end
  # end
end
