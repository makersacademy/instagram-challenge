require 'spec_helper'

describe Photo, type: :model do
  it { should have_many(:comments).dependent(:destroy) }

  it { should belong_to(:user) }

  it 'link must be provided' do
    photo = Photo.new(description: 'nice')
    expect(photo).to have(1).error_on(:image_file_name)
    expect(photo).not_to be_valid
  end

  describe 'build_with_user' do

    let(:user) { User.create email: 'test@test.com' }
    let(:photo) { Photo.create(description:'nice', image_file_name:'spec/fixtures/files/gramophone.png', user_id: user.id) }
    #let(:like_params) { {rating: 5, thoughts: 'yum'} }

    subject(:like) { photo.likes.create(user.id) }

    it 'builds a like' do
      expect(like).to be_a Like
    end

    it 'builds a like associated with the specified user' do
      expect(like.user_id).to eq user.id
    end
  end
end