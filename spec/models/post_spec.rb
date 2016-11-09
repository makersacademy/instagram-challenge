require "spec_helper"

describe Post, type: :model do

  it { should belong_to :user }
  it { should have_many :comments }
  it { should have_many :irons }
  


  it "is invalid if there is no picture attached" do
    post = Post.new(title: 'Test Post')
    expect(post).to have(1).error_on(:image)
    expect(post).not_to be_valid
  end

  describe '#destroy_if_created_by?' do

    let(:user) { User.create email: 'test@test.com', password: 'Test123' }
    let(:another_user) { User.create email: 'another@test.com', password: 'Another123' }

    subject(:post) { Post.create title: 'Test Post',
      :image => File.new(Rails.root + 'spec/fixtures/Iron-Man-Beta.jpg'),
      :user_id => user.id }

      it 'destroys itself if it belongs to the user' do
        expect(post.destroy_if_created_by?(user)).to eq true
        expect(user.posts.count).to be 0
      end

      it 'does not destroy itself if it belongs to another user' do
        expect(post.destroy_if_created_by?(another_user)).to eq false
        expect(user.posts.count).to be 1
      end
    end

  end
