require 'rails_helper'

describe User do

  it { is_expected.to have_many :pictures }
  it { is_expected.to have_many :comments }

  subject(:user) { described_class.create(username: 'jinis',
                                          email: 'test@test.com',
                                          password: 'passwordforjinis',
                                          password_confirmation: 'passwordforjinis')}

  let(:own_pic) { double(:picture, user_id: user.id) }
  let(:others_pic) { double(:picture, user_id: user.id + 1) }

  # let(:own_comment) { double(:comment, user_id: user.id) }
  # let(:others_comment) { double(:comment, user_id: user.id + 1) }

  describe '#is_owner?' do
    it 'should return true if the user owns the picture' do
      expect(user.is_owner_of?(own_pic)).to eq true
    end
    it 'should return false if the user owns the picture' do
      expect(user.is_owner_of?(others_pic)).to eq false
    end
  end
end
