require 'spec_helper'

describe Iron, type: :model do
  let(:user) { User.create email: 'test@test.com', password: 'Test123' }
  let(:post) { Post.create title: 'Test Post',
    :image => File.new(Rails.root + 'spec/fixtures/Iron-Man-Beta.jpg'),
    :user_id => user.id }
    subject(:iron) { Iron.create user_id: user.id, post_id: post.id }

    it { should belong_to :post }
    it { should belong_to :user }

    it "can not be created twice by the same user" do
      subject
      iron2 = Iron.new user_id: user.id, post_id: post.id
      expect(iron2).to have(1).error_on(:user)
      expect(iron2).not_to be_valid
    end

    describe '#destroy_if_created_by?' do
      let(:another_user) { User.create email: 'another@test.com', password: 'Another123' }

      it 'destroys itself if it belongs to the user and post' do
        expect(subject.destroy_if_created_by?(user)).to eq true
        expect(user.irons.count).to be 0
        expect(post.irons.count).to be 0
      end

      it 'does not destroy itself if it belongs to another user' do
        expect(subject.destroy_if_created_by?(another_user)).to eq false
        expect(user.irons.count).to be 1
      end
    end

  end
