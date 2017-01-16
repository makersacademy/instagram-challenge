require 'rails_helper'

RSpec.describe Picture, type: :model do

  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes }

  describe 'commments' do
    describe 'build_with_user' do

      let(:user) { User.create email: "test@example" }
      let(:picture) { Picture.create caption: "test caption"}
      let(:comment_params) { {comment: "test comment"} }

      subject(:comment) { picture.comments.build_with_user(comment_params, user)}

      it 'builds a comment' do
        expect(comment).to be_a Comment
      end

      it 'builds a review associated with the specified user' do
        expect(comment.user).to eq user
      end
    end
  end
end
