RSpec.describe Comment, type: :model do

  it { is_expected.to belong_to :post }
  it { is_expected.to have_many :likes}


  describe '#author' do
    let(:user) {User.create(username: 'bob', email: 'abc@abc.com')}

    it 'returns the username of the comments author' do
      comment = Comment.create(content: 'abc', user: user)
      expect(comment.author).to eq 'bob'
    end
  end
end
