require 'rails_helper'
RSpec.describe Picture, type: :model do

  # it { should belong_to(:user) }

  it 'is not valid with a name of less than two characters' do
    picture = Picture.new(name: 'A')
    expect(picture).to have(1).error_on(:name)
    expect(picture).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    user = User.create(email: "dog@dog.com", password: 'password123')
    user.pictures.create(name: "Selfie")
    picture = user.pictures.new(name: "Selfie")
    expect(picture).to have(1).error_on(:name)
  end

  describe 'comments' do
    describe 'build_with_user' do

      let(:user) { User.create email: 'test@test.com' }
      let(:picture) { Picture.create name: 'Test' }
      let(:comment_params) { {thoughts: 'yum'} }

      subject(:comment) { picture.comments.build_with_user(comment_params, user) }

      it 'builds a comment' do
        expect(comment).to be_a Comment
      end

      it 'builds a comment associated with the specified user' do
        expect(comment.user).to eq user
      end
    end
  end

end
