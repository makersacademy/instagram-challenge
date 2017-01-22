require 'rails_helper'

RSpec.describe Photo, type: :model do

it { is_expected.to belong_to :user }
it { is_expected.to have_many :likes }

  describe 'comments' do
    describe 'build_with_user' do

      let(:user) { User.create email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest' }
      let(:photo) { Photo.create description: 'A fun trip to the beach!' }
      let(:comment_params) { {remarks: "I love this <3"} }

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
