describe 'comments' do
  describe 'build_with_user' do

    let(:user) { User.create email: 'test@test.com' }
    let(:moment) { Moment.create description: 'Test' }
    let(:comment_params) { {comment: 'That is profound'} }

    subject(:comment) { moment.comments.build_with_user(comment_params, user) }

    it 'builds a review' do
      expect(comment).to be_a Comment
    end

    it 'builds a review associated with the specified user' do
      expect(comment.user).to eq user
    end
  end
end
