require 'rails_helper'

describe Image, type: :model do



  describe '#liked_by_current_user' do

    let(:image_title) { "Beast and Magneto" }
    let(:image_desc) { "Two cheeky Rabbits" }
    let(:image_file_jpeg) { File.new('spec/fixture/test_rabbits.jpeg') }
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
