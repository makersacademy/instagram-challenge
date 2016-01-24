require 'rails_helper'

describe Picture, type: :model do
  it { should belong_to (:user) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:likes).dependent(:destroy) }
  it { should validate_presence_of(:image) }

  describe '#build_comment' do
    let(:user) {create :user, :first}
    xit 'associates a comment with a user' do
      picture = Picture.new({description: 'My picture',
      image: Rack::Test::UploadedFile.new('spec/factories/test.jpg', 'images/jpg')})
      comment_params = {comment: 'My comment'}
      comment = picture.build_comment(comment_params, user)
      comment.save
      expect(comment).to eq user
    end

    it 'returns a comment' do
      picture = Picture.new({description: 'My picture',
      image: Rack::Test::UploadedFile.new('spec/factories/test.jpg', 'images/jpg')})
      comment_params = {comment: 'My comment'}
      comment = picture.build_comment(comment_params, user)
      comment.save
      expect(comment).to be_a Comment
    end
  end
end
