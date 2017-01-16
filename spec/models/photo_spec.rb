require 'rails_helper'

describe Photo, type: :model do
  it 'is not valid with a title of less than three characters' do
    photo = Photo.new(title: "Te")
    expect(photo).to have(1).error_on(:title)
    expect(photo).not_to be_valid
  end

  describe 'comments' do
    describe 'build_with_user' do

      let(:user) { User.create email: 'test@test.com' }
      let(:photo) { Photo.create title: 'Test photo' }
      let(:comment_params) { {thoughts: 'This is a test'} }

      subject(:comment) { photo.comments.build_with_user(comment_params, user) }

      it 'builds a review' do
        expect(comment).to be_a Comment
      end

      it 'builds a review associated with the specified user' do
        expect(comment.user).to eq user
      end
    end
  end

end
