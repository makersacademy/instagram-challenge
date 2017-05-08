require 'rails_helper'

describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:experiences) }
    it { is_expected.to have_many(:comments) }
  end

  describe 'Database Table' do
    it { is_expected.to have_db_column(:username).of_type(:string) }
  end

  describe 'Validations' do
    it 'should not be able to sign up with a username that alreay exists' do
      create_user
      expect {create_user(email:'emmpak@makers.com') }.not_to change {User.count}
    end

    it 'should not be able to register without a username' do
      user = create_user(username: '')
      expect(user).to have(1).error_on(:username)
      expect(user).not_to be_valid
      expect {create_user(username:'') }.not_to change {User.count}
    end
  end
end
