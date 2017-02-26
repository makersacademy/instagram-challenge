describe 'comments' do
  describe 'build_with_user' do

    let(:user) { User.create email: 'test@test.com' }
    let(:picture) { Picture.create description: 'Test' }
    let(:comments_params) { {thoughts: 'nice'} }

    subject(:comment) { picture.comments.build_with_user(comments_params, user) }

    it 'is not valid with no image' do
      test_image = Image.new(title: image_title, description: image_desc, image_file: '')
      expect(test_image).to have(1).error_on(:image_file)
      expect(test_image).not_to be_valid
    end
    it 'builds a comment' do
      expect(comment).to be_a Comment
    end

    it 'builds a comment associated with the specified user' do
      expect(comment.user).to eq user
    end
  end
end
