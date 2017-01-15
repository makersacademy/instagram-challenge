describe 'comments' do
  describe 'build_with_user' do

    let(:user) {User.create(email: 'test@test.com', password: 'password')}
    let(:photograph) {user.photographs.create(description: 'description')}
    let(:comment_params) {{description: 'description'}}

    subject(:comment) {photograph.comments.build_with_user(comment_params, user)}

    it 'builds a comment' do
      expect(comment).to be_a Comment
    end

    it 'builds a comment associated with the specified user' do
      expect(comment.user).to eq user
    end
  end
end
