require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :comments}
  it { is_expected.to have_many :likes}

  it 'is not valid without a photo attachment' do
    photo = Photo.new
    expect(photo).not_to be_valid
  end

  describe 'build_with_user' do

    let(:user) { create(:user) }

    let(:photo) { Photo.create picture:  Rack::Test::UploadedFile.new(Rails.root + 'spec/images/dimensions.png', 'image/png')}
    let(:comment_params) { { content: 'text' } }

    subject(:content) { photo.comments.build_with_user(comment_params, user) }

    it 'builds a comment' do
      expect(content).to be_a Comment
    end

    it 'builds a comment associated with the specific user' do
      expect(content.user).to eq user
    end

  end

  describe 'create_with_user' do

    let(:user) { create(:user) }

    let(:photo) { Photo.create picture:  Rack::Test::UploadedFile.new(Rails.root + 'spec/images/dimensions.png', 'image/png')}
    let(:comment_params) { { content: 'text' } }

    subject(:content) { photo.comments.create_with_user(comment_params, user) }

    it 'builds a comment' do
      expect(content).to be_a Comment
    end

    it 'create a comment associated with the specific user' do
      expect(content.user).to eq user
    end

    it 'adds comment to database' do
      photo.comments.create_with_user(comment_params, user)
      expect(Comment.count).to eq(1)
    end
  end
end
