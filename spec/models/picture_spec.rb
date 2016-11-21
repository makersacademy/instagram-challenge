require 'rails_helper'

RSpec.describe Picture, type: :model do
  it { should have_many :comments }
  it { should belong_to :user}
  it { should have_many :likes }

  describe 'comments' do
    describe 'build_with_user' do
      let(:user) { User.create email: 'test@test.com' }
      let(:picture) { Picture.create title: 'Test' }
      let(:comment_params) { {words: "test"} }

      subject(:comment) { picture.comments.build_with_user(comment_params, user) }

      it 'builds a review' do
        expect(comment).to be_a Comment
      end

      it 'builds a review associated with the user' do
        expect(comment.user).to eq user
      end

    end
  end

end
