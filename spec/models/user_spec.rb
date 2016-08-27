require 'rails_helper'

RSpec.describe User, type: :model do

  it 'allows to pass in username when creating a user' do
    user = User.create(email: 'test@test.com', password: 'password', username: 'arukomp')
    expect(user.username).to eq 'arukomp'
  end

  it 'username is required' do
    user = User.create(email: 'test@test.com', password: 'password')
    expect(user).to have(1).error_on(:username)
  end

  it 'username is unique' do
    User.create(email: 'test@test.com', password: 'password', username: 'arukomp')
    user = User.create(email: 'another@test.com', password: 'password', username: 'arukomp')
    expect(user).to have(1).error_on(:username)
  end

  it { is_expected.to validate_uniqueness_of(:username).case_insensitive }

  it 'creates a Feed upon registration' do
    user = User.new(email: 'test@test.com', password: 'password', username: 'arukomp')
    expect{ user.save }.to change(Feed, :count).by(1)
  end

  describe 'feed' do
    it { is_expected.to have_one :feed }
  end

  describe '#following?' do

    let(:user1) { User.create(email: 'test@test.com', password: 'password', username: 'user1') }
    let(:user2) { User.create(email: 'test2@test.com', password: 'password', username: 'user2') }

    it 'returns true if user is following another user' do
      user1.follow(user2)
      expect(user1.following?(user2)).to eq true
    end

    it 'returns false if user is NOT following another user' do
      expect(user1.following?(user2)).to eq false
    end

  end

  describe '#follow/#unfollow' do

    let(:user1) { User.create(email: 'test@test.com', password: 'password', username: 'user1') }
    let(:user2) { User.create(email: 'test2@test.com', password: 'password', username: 'user2') }

    it 'follows the user' do
      user1.follow(user2)
      expect(user1).to be_following user2
    end

    it 'can unfollow the user' do
      user1.follow(user2)
      expect(user1).to be_following user2
      user1.unfollow(user2)
      expect(user1).to_not be_following user2
    end

    it 'cannot follow itself' do
      expect{ user1.follow(user1) }.to_not change{ user1.following.count }
    end

  end

end
