require 'rails_helper'

RSpec.describe Photo, type: :model do
  let(:user) { create(:user) }

  it { is_expected.to belong_to(:user) }

  it { is_expected.to have_many(:comments).dependent(:destroy) }

  it { is_expected.to have_many(:likes).dependent(:destroy) }

  it 'is not valid when it is not uploaded by a user' do
    photo = Photo.create(description: 'test', image: File.new("#{Rails.root}/spec/support/fixtures/images/testing.png") )
    expect(photo).not_to be_valid
  end

  it 'it valid when it is uploaded by a user' do
    photo = user.photos.create(description: 'test', image: File.new("#{Rails.root}/spec/support/fixtures/images/testing.png") )
    expect(photo).to be_valid
  end

  context 'destroying a photo' do
    let(:photo) { create(:photo, user: user) }
    let(:user2) { create(:user2) }

    it 'is destroyed when deleted by its creator' do
      photo.destroy_as_user(user)
      expect(Photo.all.last).to eq nil
    end

    it 'is not destroyed when deleted by some other user' do
      photo.destroy_as_user(user2)
      expect(Photo.all.last).to eq photo
    end
  end
end

describe 'likes' do
  describe 'build_with_user' do

    let(:photo) { create(:photo) }
    let(:user) { build(:user) }

    subject(:like) { photo.likes.build_with_user(user) }

    it 'builds a like' do
      expect(like).to be_a Like
    end

    it 'builds a like associated with the specified user' do
      expect(like.user).to eq user
    end
  end
end
