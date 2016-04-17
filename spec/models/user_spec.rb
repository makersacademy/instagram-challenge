require 'rails_helper'

describe User do

  it { is_expected.to have_many :pictures }
  it { is_expected.to have_many :comments }

  subject(:user) { described_class.create(username: 'jinis',
                                          email: 'test@test.com',
                                          password: 'passwordforjinis',
                                          password_confirmation: 'passwordforjinis')}

  let(:own_post) { double(:post, user_id: user.id) }
  let(:others_post) { double(:post, user_id: user.id + 1) }

  describe '#is_owner_of?(post)' do
    it 'should return true if the user owns the picture' do
      expect(user.is_owner_of?(own_post)).to eq true
    end
    it 'should return false if the user owns the picture' do
      expect(user.is_owner_of?(others_post)).to eq false
    end
  end
end
