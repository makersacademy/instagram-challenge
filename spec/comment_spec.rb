require 'rails_helper'

describe Comment, type: :model do

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

    it 'comment cannot be blank' do
      test_comment = image.comments.build_with_user( { text: ''}, user)
      expect(test_comment).to have(1).error_on(:text)
      expect(test_comment).not_to be_valid
    end
    it 'comment cannot be "Type a comment here…"' do
      test_comment = image.comments.build_with_user( { text: 'Type a comment here…'}, user)
      expect(test_comment).to have(1).error_on(:text)
      expect(test_comment).not_to be_valid
    end
  end

end
