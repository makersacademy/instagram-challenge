require 'rails_helper'

RSpec.describe PhotosHelper, type: :helper do
  describe 'reviews' do
    describe 'build_with_user' do

      let(:user) { User.create username: 'fake', email: 'test@test.com' }
      let(:photo) { Photo.create name: 'testcat', image_file_name: "catgrumps.jpg" }
      let(:comment_params) { {thoughts: 'grumppy'} }

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
