require 'rails_helper'

describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:experiences) }
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
      expect {create_user(username:'') }.not_to change {User.count}
    end
  end
end
