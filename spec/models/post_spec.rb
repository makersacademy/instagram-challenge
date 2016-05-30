RSpec.describe Post, type: :model do

  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes}

  describe '#belongs_to?' do
    let(:user) {User.create(email: 'abc@abc.com')}
    let(:user2) {User.create(email: 'abd@abc.com')}

    it 'returns true if the posts user matches the supplied user' do
      post = Post.create(title: 'abc', user: user)
      expect(post.belongs_to? user).to eq true
    end

    it 'returns false if the posts user doesn\'t match the supplied user' do
      post = Post.create(title: 'abc', user: user)
      expect(post.belongs_to? user2).to eq false
    end
  end

end
